# Diesel ON "Flicker" — ported to Wear OS Watch Face Format

This version replaces the first pass. That one recreated the dial by hand from
scratch. This one is built directly from the real assets inside your
`Diesel.zip` decompile (`assets/ds_flicker/…`), so it's a much closer port.

## What's real vs. rebuilt

**Real, unmodified original art:**
- `dial_am3/am6/am7/am8/am9/am10/am11/pm12/pm1/pm2/pm3/pm4/pm5/pm6/pm7/pm8/pm9.png`
  — these are the app's actual baked dial renders. `dial_pm9` is the
  full-brightness cyan/red neon look from your reference photo.
- `dial_ambient.png` — the real flat white line-art plate the app uses for
  always-on-display.
- `hand_hr_ambient.png` / `hand_min_ambient.png` — the real upright dagger-hand
  alpha masks, tinted red (same as the previous build — these were already
  correct).
- `hand_sec_pm9.png` — the real second-hand needle (glowing red tip, dark
  shaft, hub + counterweight tail). Turned out to be baked perfectly upright,
  so it drops straight in as a rotating template — no rebuild needed. This
  replaces the crude solid-red-line placeholder from the first pass.
- `ds_digi.ttf` — the original DS-DIGIB font for the date.

**Not from Diesel's assets, pulled from the OS instead:**
- Complication icons. Diesel doesn't ship its own heart/battery glyphs — like
  any Wear OS face, it just displays whatever icon the chosen complication
  data source hands it. So instead of baking in a heart/battery PNG, the XML
  uses `[COMPLICATION.MONOCHROMATIC_IMAGE]`, which pulls the real icon from
  whichever provider is active. Default providers are still Heart Rate and
  Battery, but if you (or anyone wearing it) swaps either slot to Steps,
  Weather, a calendar, etc. via the normal long-press editor, the correct
  icon shows automatically — no hardcoded art to get "stuck."

## v4 fixes (from on-watch testing)

| Symptom | Cause | Fix |
|---|---|---|
| AOD showed only red hands, no white plate | WFF `alpha` is **0-255**; v3 used `1`/`0` (1/255 = invisible) and a `<Variant>` with no `mode`, which is invalid | Ambient plate is a Group with `alpha="0"` + `<Variant mode="AMBIENT" target="alpha" value="255"/>` |
| AOD hands were red | v3 reused the red hands | Added the original app's white outline hands (`hand_hour_ambient` / `hand_minute_ambient`) as 2nd Hour/Minute hand in the same AnalogClock, shown only in ambient; red hands + seconds hidden in ambient |
| Complication text never rendered | `<Template>` had no `%s` placeholder | `<Template>%s<Parameter expression="[COMPLICATION.TEXT]"/></Template>` |
| Face couldn't be edited | `watch_face_info.xml` had no `<Editable value="true"/>` (defaults to false, hides the Edit button) | Added it |
| Hour plates | expressions were in an invalid Variant | Now `<Transform target="alpha" value="(cond) ? 255 : 0"/>` inside each PartImage |

Also: date hidden in ambient (original AOD has none); slots now accept SHORT_TEXT, RANGED_VALUE,
MONOCHROMATIC_IMAGE, SMALL_IMAGE so more providers show up in the picker.

Complications are still hidden in ambient because the original AOD has none. To show them dimmed instead,
change the two `<Variant mode="AMBIENT" target="alpha" value="0" />` on the ComplicationSlots to `value="150"`.

## The day-long color shift you described

Your description (fading toward pale/silver around 11-12-1, shifting into
different colors from 3-4-5 on) matches what's actually in the asset pack:
17 real dial captures, each a different neon/metal "mood" tied to a specific
hour. I mapped all 17 onto the 24-hour clock:

| Hours (24h) | Asset | Look |
|---|---|---|
| 0–3 | `dial_am3` | deep navy, dead-of-night |
| 4–6 | `dial_am6` | dim silver, dawn |
| 7 | `dial_am7` | olive/silver |
| 8 | `dial_am8` | silver |
| 9 | `dial_am9` | teal/mint |
| 10 | `dial_am10` | silver |
| 11 | `dial_am11` | pale, fading neon |
| 12 | `dial_pm12` | warm gold (noon) |
| 13 | `dial_pm1` | champagne/silver |
| 14 | `dial_pm2` | silver |
| 15 | `dial_pm3` | copper/orange |
| 16 | `dial_pm4` | deeper orange-red |
| 17 | `dial_pm5` | purple dusk |
| 18 | `dial_pm6` | silver |
| 19 | `dial_pm7` | silver |
| 20 | `dial_pm8` | full cyan/red neon |
| 21–23 | `dial_pm9` | full cyan/red neon (your reference look) |

The asset pack only had real captures for 17 of the 24 hours — hours 0-2, 4-5,
and 22-23 don't have their own file, so they borrow the nearest captured
neighbor rather than inventing new art. If you find the actual missing frames
elsewhere in the Diesel APK, send them over and I'll slot in the real ones.

**Important caveat:** WFF backgrounds don't normally swap by time of day —
I've implemented it using conditional `<Variant target="alpha" value="...">`
expressions keyed to `[HOUR_0_23]` (e.g. `[HOUR_0_23]==15?1:0` for 3pm). This
is a real, documented part of the Watch Face Format expression language, but
I don't have an actual WFF build/validator in this environment to test it
against, so treat it as best-effort. If `aapt2`/apktool chokes on a specific
line, it'll name the exact attribute — paste the error back and I'll fix it
immediately. If it turns out the hour-conditional syntax isn't accepted at
all, the fallback is trivial: delete all the `<PartImage>` layers except the
`dial_pm9` one and remove its `<Variant>` line, and you're back to a single
static neon background (guaranteed to work, just without the day cycle).

The hands stay a constant red tint across all 17 backgrounds rather than
re-color-matching each mood (e.g. blue-tinted hands on the navy dial) — that
would need extracting a proper tint per mood and wasn't in scope for this
pass. Happy to take a crack at it if you want that too.

## What's still simplified vs. the original app

- The animated neon "flicker" power-on GIFs (`flicker_am3_*`, `flicker_pm8_*`,
  `flicker_pm9_*`) rely on the original app's frame-by-frame animation
  engine, which WFF has no equivalent for. Not ported.
- Hands are static red across the whole day (see above).

## How to build this into an installable APK

There are two paths. **Important either way: this must be its own
standalone APK.** WFF watch faces are resource-only (`hasCode="false"`)
and Google's own guidance is that the bundle containing them must be
completely separate from any app that has real code — don't try to graft
this into the Diesel app's own decompiled project.

### Option A — Android Studio (recommended, most reliable)
1. **New project** → File → New → New Project → **Wear OS** → **Watch Face
   Format** (or "No Activity" if your Studio version doesn't have the WFF
   template). Minimum SDK 34+.
2. In the new project's `app/src/main/res/`, copy in this package's
   `res/raw`, `res/xml`, `res/drawable-nodpi`, and `res/font` folders,
   replacing the template's sample `watchface.xml` and
   `watch_face_info.xml` with the ones here.
3. Check the generated `AndroidManifest.xml` already has
   `android:hasCode="false"` and the `format.version` property set to
   `4`+ (it should, from the template).
4. Copy the `watch_face_name` string from this package's
   `res/values/strings.xml` into the project's own `strings.xml`.
5. Build → Run with your watch connected, or
   `./gradlew assembleDebug` then `adb install`.

### Option B — on-device (APK Easy Tool / apktool), fresh project
This package includes a standalone `AndroidManifest.xml` and `apktool.yml`
at its root, made for exactly this — a brand-new project apktool can build
directly, no donor APK required:

1. Copy the whole `DieselFlicker_WFF` folder onto your device as its own
   project folder (e.g. `/storage/emulated/0/Backport/DieselFlicker/`) —
   **not** inside the Diesel project.
2. In APK Easy Tool, use its build/compile function pointed at that
   folder. It should run apktool's `b` (build) step directly against the
   `AndroidManifest.xml` + `res/` + `apktool.yml` here.
3. Sign the resulting APK (APK Easy Tool's built-in signer is fine — WFF
   sideloading just needs a valid signature, not a Play-store one).
4. `adb install DieselFlicker.apk`, then pick it from the watch's face
   picker.
5. If aapt2 complains about anything, it'll name the exact
   attribute/line — paste it back to me and I'll fix the XML.

## If something looks off
- `res/raw/watchface.xml` has the hand pivot points and complication
  coordinates commented where relevant.
- To change which two complications are default, edit the
  `defaultSystemProvider` values on the two `<ComplicationSlot>` blocks.
  Anyone wearing it can still change them from the watch itself regardless.
- Use Google's WFF validator before installing to catch typos:
  `java -jar wff-validator.jar 4 res/raw/watchface.xml`
