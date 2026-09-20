<?xml version="1.0" encoding="UTF-8"?>
<WatchFace width="454" height="454" clipShape="CIRCLE">

    <Metadata key="PREVIEW_TIME" value="1728558600000" />

    <!-- WFF USER CONFIGURATIONS: these are consumed by the Wear OS WFF editor. -->
    <UserConfigurations>
        <ListConfiguration id="movement_style" displayName="@string/movement_style" defaultOption="quartz">
            <ListOption id="quartz" displayName="@string/movement_quartz" />
            <ListOption id="sweeping" displayName="@string/movement_sweeping" />
            <ListOption id="mechanical" displayName="@string/movement_mechanical" />
        </ListConfiguration>
        <ListConfiguration id="crystal_color" displayName="@string/crystal_color" defaultOption="orange">
            <ListOption id="orange" displayName="@string/crystal_orange" />
            <ListOption id="green" displayName="@string/crystal_green" />
            <ListOption id="blue" displayName="@string/crystal_blue" />
            <ListOption id="yellow" displayName="@string/crystal_yellow" />
            <ListOption id="red" displayName="@string/crystal_red" />
            <ListOption id="red_blue" displayName="@string/crystal_red_blue" />
            <ListOption id="yellow_blue" displayName="@string/crystal_yellow_blue" />
            <ListOption id="blue_green" displayName="@string/crystal_blue_green" />
            <ListOption id="pink_green" displayName="@string/crystal_pink_green" />
            <ListOption id="green_blue" displayName="@string/crystal_green_blue" />
            <ListOption id="red_gold" displayName="@string/crystal_red_gold" />
            <ListOption id="green_gold" displayName="@string/crystal_green_gold" />
            <ListOption id="blue_purple" displayName="@string/crystal_blue_purple" />
            <ListOption id="light_pink" displayName="@string/crystal_light_pink" />
            <ListOption id="light_green" displayName="@string/crystal_light_green" />
        </ListConfiguration>
        <BooleanConfiguration id="colored_crystal" displayName="@string/colored_crystal" defaultValue="TRUE" />
    </UserConfigurations>

    <Scene backgroundColor="#000000">

        <!-- ===== AMBIENT (AOD) PLATE: white line art on black =====
             WFF alpha is 0-255. Starts invisible, fades in ONLY in ambient. -->
        <Group name="dial_ambient_group" x="0" y="0" width="454" height="454" alpha="0">
            <Variant mode="AMBIENT" target="alpha" value="255" />
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_ambient" />
            </PartImage>
        </Group>

        <!-- ===== INTERACTIVE: hour-mapped neon plates (one visible at a time) =====
             Hidden in ambient. Each layer's alpha is driven by [HOUR_0_23]. -->
        <Group name="dial_interactive_group" x="0" y="0" width="454" height="454">
            <Variant mode="AMBIENT" target="alpha" value="0" />
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_am3" />
                <Transform target="alpha" value="([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_blue_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_green&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_pink_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;pink_green&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_green_blue" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_blue&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_red_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;red_gold&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_green_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_gold&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_blue_purple" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_purple&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_light_pink" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_pink&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am3_light_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_green&quot;) &amp;&amp; ([HOUR_0_23] &lt;= 3) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_am6" />
                <Transform target="alpha" value="([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_blue_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_green&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_pink_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;pink_green&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_green_blue" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_blue&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_red_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;red_gold&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_green_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_gold&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_blue_purple" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_purple&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_light_pink" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_pink&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am6_light_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_green&quot;) &amp;&amp; ([HOUR_0_23] &gt;= 4 &amp;&amp; [HOUR_0_23] &lt;= 6) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_am7" />
                <Transform target="alpha" value="([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_blue_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_green&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_pink_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;pink_green&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_green_blue" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_blue&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_red_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;red_gold&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_green_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_gold&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_blue_purple" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_purple&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_light_pink" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_pink&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am7_light_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_green&quot;) &amp;&amp; ([HOUR_0_23] == 7) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_am8" />
                <Transform target="alpha" value="([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_blue_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_green&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_pink_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;pink_green&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_green_blue" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_blue&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_red_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;red_gold&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_green_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_gold&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_blue_purple" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_purple&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_light_pink" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_pink&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am8_light_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_green&quot;) &amp;&amp; ([HOUR_0_23] == 8) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_am9" />
                <Transform target="alpha" value="([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_blue_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_green&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_pink_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;pink_green&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_green_blue" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_blue&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_red_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;red_gold&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_green_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_gold&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_blue_purple" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_purple&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_light_pink" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_pink&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am9_light_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;light_green&quot;) &amp;&amp; ([HOUR_0_23] == 9) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_am10" />
                <Transform target="alpha" value="([HOUR_0_23] == 10) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am10_blue_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;blue_green&quot;) &amp;&amp; ([HOUR_0_23] == 10) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am10_pink_green" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;pink_green&quot;) &amp;&amp; ([HOUR_0_23] == 10) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am10_green_blue" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;green_blue&quot;) &amp;&amp; ([HOUR_0_23] == 10) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am10_red_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;red_gold&quot;) &amp;&amp; ([HOUR_0_23] == 10) ? 255 : 0" />
            </PartImage>
            <PartImage x="0" y="0" width="454" height="454">
                <Image resource="dial_crystal_am10_green_gold" />
                <Transform target="alpha" value="[CONFIGURATION.colored_crystal] &amp;&amp; ([CONFIGURATION.crystal_color] == &quot;g
