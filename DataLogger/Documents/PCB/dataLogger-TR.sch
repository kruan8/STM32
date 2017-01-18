<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="100" unitdist="mil" unit="mil" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Doplnky" color="5" fill="1" visible="yes" active="yes"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="97" name="Info" color="7" fill="1" visible="no" active="no"/>
<layer number="98" name="Guide" color="6" fill="1" visible="no" active="no"/>
<layer number="100" name="PaJa" color="12" fill="7" visible="no" active="no"/>
<layer number="102" name="Kola" color="11" fill="7" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Vladicek">
<packages>
<package name="TSSOP20-I">
<description>&lt;b&gt;TSSOP20-I&lt;/b&gt;&lt;p&gt;
20-pin thin shrink small outline package</description>
<wire x1="-3.25" y1="-2.2" x2="-3.25" y2="2.2" width="0.127" layer="21"/>
<wire x1="-3.25" y1="2.2" x2="3.25" y2="2.2" width="0.127" layer="21"/>
<wire x1="3.25" y1="2.2" x2="3.25" y2="-2.2" width="0.127" layer="21"/>
<wire x1="3.25" y1="-2.2" x2="-3.25" y2="-2.2" width="0.127" layer="21"/>
<smd name="1" x="-2.925" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="2" x="-2.275" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="3" x="-1.625" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="4" x="-0.975" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="5" x="-0.325" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="6" x="0.325" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="7" x="0.975" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="8" x="1.625" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="9" x="2.275" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="10" x="2.925" y="-2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="11" x="2.925" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="12" x="2.275" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="13" x="1.625" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="14" x="0.975" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="15" x="0.325" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="16" x="-0.325" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="17" x="-0.975" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="18" x="-1.625" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="19" x="-2.275" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<smd name="20" x="-2.925" y="2.875" dx="1.35" dy="0.4" layer="1" rot="R90"/>
<text x="-3.21" y="3.71" size="1.27" layer="25">&gt;Name</text>
<text x="-3.25" y="-4.895" size="1.27" layer="27">&gt;Value</text>
<circle x="-2.655" y="-1.595" radius="0.383959375" width="0.127" layer="21"/>
<rectangle x1="-3.05" y1="-3.2" x2="-2.8" y2="-2.2" layer="51"/>
<rectangle x1="-2.4" y1="-3.2" x2="-2.15" y2="-2.2" layer="51"/>
<rectangle x1="-1.75" y1="-3.2" x2="-1.5" y2="-2.2" layer="51"/>
<rectangle x1="-1.1" y1="-3.2" x2="-0.85" y2="-2.2" layer="51"/>
<rectangle x1="-0.45" y1="-3.2" x2="-0.2" y2="-2.2" layer="51"/>
<rectangle x1="0.2" y1="-3.2" x2="0.45" y2="-2.2" layer="51"/>
<rectangle x1="0.85" y1="-3.2" x2="1.1" y2="-2.2" layer="51"/>
<rectangle x1="1.5" y1="-3.2" x2="1.75" y2="-2.2" layer="51"/>
<rectangle x1="2.15" y1="-3.2" x2="2.4" y2="-2.2" layer="51"/>
<rectangle x1="2.8" y1="-3.2" x2="3.05" y2="-2.2" layer="51"/>
<rectangle x1="2.8" y1="2.2" x2="3.05" y2="3.2" layer="51"/>
<rectangle x1="2.15" y1="2.2" x2="2.4" y2="3.2" layer="51"/>
<rectangle x1="1.5" y1="2.2" x2="1.75" y2="3.2" layer="51"/>
<rectangle x1="0.85" y1="2.2" x2="1.1" y2="3.2" layer="51"/>
<rectangle x1="0.2" y1="2.2" x2="0.45" y2="3.2" layer="51"/>
<rectangle x1="-0.45" y1="2.2" x2="-0.2" y2="3.2" layer="51"/>
<rectangle x1="-1.1" y1="2.2" x2="-0.85" y2="3.2" layer="51"/>
<rectangle x1="-1.75" y1="2.2" x2="-1.5" y2="3.2" layer="51"/>
<rectangle x1="-2.4" y1="2.2" x2="-2.15" y2="3.2" layer="51"/>
<rectangle x1="-3.05" y1="2.2" x2="-2.8" y2="3.2" layer="51"/>
</package>
<package name="CR2032H">
<description>&lt;b&gt;LI BATTERY&lt;/b&gt; Varta</description>
<wire x1="-10.16" y1="1.905" x2="-8.89" y2="1.905" width="0.254" layer="21"/>
<wire x1="-9.525" y1="2.54" x2="-9.525" y2="1.27" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="21"/>
<pad name="+@1" x="-11.35" y="0.54" drill="1.6" diameter="3.81" shape="octagon"/>
<pad name="+" x="10.31" y="0.5" drill="1.6" diameter="3.81" shape="octagon"/>
<pad name="-" x="0" y="0.635" drill="1.2" diameter="3.81" shape="octagon"/>
<text x="-3.81" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="2.54" y="-4.445" size="1.27" layer="27" ratio="10" rot="R180">&gt;VALUE</text>
<wire x1="6.07" y1="9.205" x2="-6.7130125" y2="9.205" width="0.1524" layer="21"/>
<wire x1="-6.7130125" y1="9.205" x2="-11.43" y2="4.4880125" width="0.1524" layer="21" curve="90"/>
<wire x1="-11.43" y1="4.4880125" x2="-11.43" y2="-4.795" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-4.795" x2="-4.39" y2="-10.795" width="0.1524" layer="21"/>
<wire x1="-4.39" y1="-10.795" x2="3.58" y2="-10.795" width="0.1524" layer="21"/>
<wire x1="3.58" y1="-10.795" x2="10.07" y2="-4.795" width="0.1524" layer="21"/>
<wire x1="10.07" y1="-4.795" x2="10.07" y2="5.205" width="0.1524" layer="21"/>
<wire x1="10.07" y1="5.205" x2="6.07" y2="9.205" width="0.1524" layer="21" curve="90"/>
</package>
<package name="SOT23">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
reflow soldering</description>
<wire x1="-1.973" y1="1.983" x2="1.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-1.983" x2="-1.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-1.983" x2="-1.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="1.983" x2="1.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="1.422" y1="0.66" x2="1.422" y2="-0.66" width="0.1524" layer="51"/>
<wire x1="1.422" y1="-0.66" x2="-1.422" y2="-0.66" width="0.1524" layer="51"/>
<wire x1="-1.422" y1="-0.66" x2="-1.422" y2="0.66" width="0.1524" layer="51"/>
<wire x1="-1.422" y1="0.66" x2="1.422" y2="0.66" width="0.1524" layer="51"/>
<wire x1="-1.422" y1="-0.152" x2="-1.422" y2="0.66" width="0.1524" layer="21"/>
<wire x1="-1.422" y1="0.66" x2="-0.864" y2="0.66" width="0.1524" layer="21"/>
<wire x1="0.864" y1="0.66" x2="1.422" y2="0.66" width="0.1524" layer="21"/>
<wire x1="1.422" y1="0.66" x2="1.422" y2="-0.152" width="0.1524" layer="21"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
<rectangle x1="-0.5001" y1="-0.3" x2="0.5001" y2="0.3" layer="35"/>
</package>
<package name="TSSOP8">
<description>&lt;b&gt;8A2-TSSOP&lt;/b&gt;&lt;p&gt;
Source: http://www.atmel.com/dyn/resources/prod_documents/doc5089.pdf</description>
<wire x1="1.225" y1="-2.175" x2="1.475" y2="-1.925" width="0.1524" layer="21" curve="90"/>
<wire x1="-1.475" y1="-1.925" x2="-1.225" y2="-2.175" width="0.1524" layer="21" curve="90"/>
<wire x1="1.235" y1="-2.175" x2="-1.215" y2="-2.175" width="0.1524" layer="21"/>
<wire x1="-1.475" y1="1.925" x2="-1.475" y2="-1.915" width="0.1524" layer="21"/>
<wire x1="1.475" y1="-1.925" x2="1.475" y2="1.925" width="0.1524" layer="21"/>
<wire x1="-1.225" y1="2.175" x2="-1.475" y2="1.925" width="0.1524" layer="21" curve="90"/>
<wire x1="1.475" y1="1.925" x2="1.225" y2="2.175" width="0.1524" layer="21" curve="90"/>
<wire x1="-1.235" y1="2.175" x2="1.215" y2="2.175" width="0.1524" layer="21"/>
<circle x="-0.82" y="-1.565" radius="0.3203" width="0.0508" layer="21"/>
<smd name="1" x="-0.975" y="-2.925" dx="0.35" dy="1" layer="1" stop="no"/>
<smd name="2" x="-0.325" y="-2.925" dx="0.35" dy="1" layer="1" stop="no"/>
<smd name="3" x="0.325" y="-2.925" dx="0.35" dy="1" layer="1" stop="no"/>
<smd name="4" x="0.975" y="-2.925" dx="0.35" dy="1" layer="1" stop="no"/>
<smd name="5" x="0.975" y="2.925" dx="0.35" dy="1" layer="1" rot="R180" stop="no"/>
<smd name="6" x="0.325" y="2.925" dx="0.35" dy="1" layer="1" rot="R180" stop="no"/>
<smd name="7" x="-0.325" y="2.925" dx="0.35" dy="1" layer="1" rot="R180" stop="no"/>
<smd name="8" x="-0.975" y="2.925" dx="0.35" dy="1" layer="1" rot="R180" stop="no"/>
<text x="-1.778" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.048" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.125" y1="-3.2" x2="-0.825" y2="-2.225" layer="51"/>
<rectangle x1="-1.175" y1="-3.475" x2="-0.775" y2="-2.4" layer="29"/>
<rectangle x1="-0.525" y1="-3.475" x2="-0.125" y2="-2.4" layer="29"/>
<rectangle x1="0.125" y1="-3.475" x2="0.525" y2="-2.4" layer="29"/>
<rectangle x1="0.775" y1="-3.475" x2="1.175" y2="-2.4" layer="29"/>
<rectangle x1="-0.475" y1="-3.2" x2="-0.175" y2="-2.225" layer="51"/>
<rectangle x1="0.175" y1="-3.2" x2="0.475" y2="-2.225" layer="51"/>
<rectangle x1="0.825" y1="-3.2" x2="1.125" y2="-2.225" layer="51"/>
<rectangle x1="0.825" y1="2.225" x2="1.125" y2="3.2" layer="51" rot="R180"/>
<rectangle x1="0.775" y1="2.4" x2="1.175" y2="3.475" layer="29" rot="R180"/>
<rectangle x1="0.125" y1="2.4" x2="0.525" y2="3.475" layer="29" rot="R180"/>
<rectangle x1="-0.525" y1="2.4" x2="-0.125" y2="3.475" layer="29" rot="R180"/>
<rectangle x1="-1.175" y1="2.4" x2="-0.775" y2="3.475" layer="29" rot="R180"/>
<rectangle x1="0.175" y1="2.225" x2="0.475" y2="3.2" layer="51" rot="R180"/>
<rectangle x1="-0.475" y1="2.225" x2="-0.175" y2="3.2" layer="51" rot="R180"/>
<rectangle x1="-1.125" y1="2.225" x2="-0.825" y2="3.2" layer="51" rot="R180"/>
</package>
<package name="SO08">
<description>&lt;b&gt;SMALL OUTLINE INTEGRATED CIRCUIT&lt;/b&gt;&lt;p&gt;
body 3.9 mm/JEDEC MS-012AA</description>
<wire x1="-2.9" y1="3.9" x2="2.9" y2="3.9" width="0.1998" layer="39"/>
<wire x1="2.9" y1="3.9" x2="2.9" y2="-3.9" width="0.1998" layer="39"/>
<wire x1="2.9" y1="-3.9" x2="-2.9" y2="-3.9" width="0.1998" layer="39"/>
<wire x1="-2.9" y1="-3.9" x2="-2.9" y2="3.9" width="0.1998" layer="39"/>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="21"/>
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="21"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-3.175" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.445" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.1501" y1="-3.1001" x2="-1.6599" y2="-2" layer="51"/>
<rectangle x1="-0.8801" y1="-3.1001" x2="-0.3899" y2="-2" layer="51"/>
<rectangle x1="0.3899" y1="-3.1001" x2="0.8801" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="-3.1001" x2="2.1501" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="2" x2="2.1501" y2="3.1001" layer="51"/>
<rectangle x1="0.3899" y1="2" x2="0.8801" y2="3.1001" layer="51"/>
<rectangle x1="-0.8801" y1="2" x2="-0.3899" y2="3.1001" layer="51"/>
<rectangle x1="-2.1501" y1="2" x2="-1.6599" y2="3.1001" layer="51"/>
<circle x="-1.625" y="-0.605" radius="0.36503125" width="0.1524" layer="21"/>
</package>
<package name="TC38H-SMD">
<wire x1="-1.397" y1="1.651" x2="1.397" y2="1.651" width="0.1524" layer="21"/>
<wire x1="1.27" y1="9.906" x2="1.524" y2="9.652" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.524" y1="9.652" x2="-1.27" y2="9.906" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="9.906" x2="1.27" y2="9.906" width="0.1524" layer="21"/>
<wire x1="1.397" y1="1.651" x2="1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.032" x2="1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.032" x2="1.524" y2="9.652" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="1.651" x2="-1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.032" x2="-1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.032" x2="-1.524" y2="9.652" width="0.1524" layer="21"/>
<wire x1="1.397" y1="2.032" x2="-1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.5588" y1="0.7112" x2="0.508" y2="0.762" width="0.4064" layer="21"/>
<wire x1="0.508" y1="0.762" x2="0.508" y2="1.143" width="0.4064" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="1.016" width="0.4064" layer="21"/>
<wire x1="-0.5588" y1="0.7112" x2="-0.508" y2="0.762" width="0.4064" layer="21"/>
<wire x1="0.635" y1="0.635" x2="1.27" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="0.635" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="5.588" x2="-0.762" y2="5.207" width="0.1524" layer="21"/>
<wire x1="0.762" y1="5.207" x2="-0.762" y2="5.207" width="0.1524" layer="21"/>
<wire x1="0.762" y1="5.207" x2="0.762" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="5.588" x2="0.762" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="5.969" x2="0" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="4.826" x2="0" y2="4.826" width="0.1524" layer="21"/>
<wire x1="0" y1="4.826" x2="0" y2="4.318" width="0.1524" layer="21"/>
<wire x1="0" y1="4.826" x2="0.762" y2="4.826" width="0.1524" layer="21"/>
<wire x1="0" y1="5.969" x2="0" y2="6.477" width="0.1524" layer="21"/>
<wire x1="0" y1="5.969" x2="0.762" y2="5.969" width="0.1524" layer="21"/>
<text x="-1.905" y="2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.175" y="2.032" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="0.3048" y1="1.016" x2="0.7112" y2="1.6002" layer="21"/>
<rectangle x1="-0.7112" y1="1.016" x2="-0.3048" y2="1.6002" layer="21"/>
<rectangle x1="-1.778" y1="1.016" x2="1.778" y2="10.414" layer="43"/>
<smd name="P$1" x="-1.27" y="0" dx="1.524" dy="1.524" layer="1" roundness="100"/>
<smd name="P$2" x="1.27" y="0" dx="1.524" dy="1.524" layer="1" roundness="100"/>
</package>
<package name="HC49/S">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-3.048" y1="-2.159" x2="3.048" y2="-2.159" width="0.4064" layer="21"/>
<wire x1="-3.048" y1="2.159" x2="3.048" y2="2.159" width="0.4064" layer="21"/>
<wire x1="-3.048" y1="-1.651" x2="3.048" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="3.048" y1="1.651" x2="-3.048" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="0.254" y2="0.762" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.762" x2="0.254" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.762" x2="-0.254" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.762" x2="-0.254" y2="0.762" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0.762" x2="0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.762" x2="-0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="1.27" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.159" x2="-3.048" y2="-2.159" width="0.4064" layer="21" curve="180"/>
<wire x1="3.048" y1="-2.159" x2="3.048" y2="2.159" width="0.4064" layer="21" curve="180"/>
<wire x1="-3.048" y1="1.651" x2="-3.048" y2="-1.651" width="0.1524" layer="21" curve="180"/>
<wire x1="3.048" y1="-1.651" x2="3.048" y2="1.651" width="0.1524" layer="21" curve="180"/>
<pad name="1" x="-2.413" y="0" drill="0.8128"/>
<pad name="2" x="2.413" y="0" drill="0.8128"/>
<text x="-5.08" y="2.667" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.937" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.445" y1="-2.54" x2="4.445" y2="2.54" layer="43"/>
<rectangle x1="-5.08" y1="-1.905" x2="-4.445" y2="1.905" layer="43"/>
<rectangle x1="-5.715" y1="-1.27" x2="-5.08" y2="1.27" layer="43"/>
<rectangle x1="4.445" y1="-1.905" x2="5.08" y2="1.905" layer="43"/>
<rectangle x1="5.08" y1="-1.27" x2="5.715" y2="1.27" layer="43"/>
</package>
<package name="HC49GW">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-5.08" y1="-6.35" x2="5.08" y2="-6.35" width="0.8128" layer="21"/>
<wire x1="4.445" y1="6.731" x2="1.016" y2="6.731" width="0.1524" layer="21"/>
<wire x1="1.016" y1="6.731" x2="-1.016" y2="6.731" width="0.1524" layer="51"/>
<wire x1="-1.016" y1="6.731" x2="-4.445" y2="6.731" width="0.1524" layer="21"/>
<wire x1="4.445" y1="6.731" x2="5.08" y2="6.096" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="6.096" x2="-4.445" y2="6.731" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.3302" y1="5.08" x2="-0.3302" y2="2.54" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="2.54" x2="0.3048" y2="2.54" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="2.54" x2="0.3048" y2="5.08" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="5.08" x2="-0.3302" y2="5.08" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="5.08" x2="0.9398" y2="3.81" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="5.08" x2="-0.9398" y2="3.81" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="3.81" x2="2.032" y2="3.81" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="3.81" x2="0.9398" y2="2.54" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="3.81" x2="-2.032" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="3.81" x2="-0.9398" y2="2.54" width="0.3048" layer="21"/>
<wire x1="-2.413" y1="-6.604" x2="-2.413" y2="-8.255" width="0.6096" layer="51"/>
<wire x1="2.413" y1="-6.477" x2="2.413" y2="-8.382" width="0.6096" layer="51"/>
<wire x1="5.08" y1="-6.35" x2="5.08" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.096" x2="-5.08" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="0" y1="8.382" x2="0" y2="6.985" width="0.6096" layer="51"/>
<smd name="1" x="-2.413" y="-8.001" dx="1.27" dy="2.54" layer="1"/>
<smd name="2" x="2.413" y="-8.001" dx="1.27" dy="2.54" layer="1"/>
<smd name="3" x="0" y="8.001" dx="1.27" dy="2.794" layer="1"/>
<text x="-5.588" y="-5.08" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.715" y1="-8.255" x2="5.715" y2="8.255" layer="43"/>
</package>
<package name="HC49TL-H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="5.334" y1="-5.715" x2="-5.461" y2="-5.715" width="0.8128" layer="21"/>
<wire x1="4.445" y1="7.366" x2="1.143" y2="7.366" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="7.366" x2="-4.445" y2="7.366" width="0.1524" layer="21"/>
<wire x1="4.445" y1="7.366" x2="5.08" y2="6.731" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="6.731" x2="-4.445" y2="7.366" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.3302" y1="5.715" x2="-0.3302" y2="3.175" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="3.175" x2="0.3048" y2="3.175" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="3.175" x2="0.3048" y2="5.715" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="5.715" x2="-0.3302" y2="5.715" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="5.715" x2="0.9398" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="5.715" x2="-0.9398" y2="4.445" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="4.445" x2="2.032" y2="4.445" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="4.445" x2="0.9398" y2="3.175" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="4.445" x2="-2.032" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="4.445" x2="-0.9398" y2="3.175" width="0.3048" layer="21"/>
<wire x1="-2.413" y1="-5.842" x2="-2.413" y2="-7.62" width="0.6096" layer="51"/>
<wire x1="2.413" y1="-5.842" x2="2.413" y2="-7.62" width="0.6096" layer="51"/>
<wire x1="5.08" y1="-5.715" x2="5.08" y2="6.731" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.731" x2="-5.08" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="1.143" y1="7.366" x2="-1.143" y2="7.366" width="0.1524" layer="51"/>
<wire x1="0" y1="7.874" x2="0" y2="7.62" width="0.6096" layer="51"/>
<pad name="1" x="-2.413" y="-7.62" drill="0.8128"/>
<pad name="2" x="2.413" y="-7.62" drill="0.8128"/>
<pad name="3" x="0" y="7.874" drill="0.8128"/>
<text x="-5.461" y="-4.445" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-2.54" y="-4.699" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.3048" y1="7.366" x2="0.3048" y2="7.5692" layer="51"/>
<rectangle x1="-6.35" y1="-6.985" x2="6.35" y2="-4.445" layer="43"/>
<rectangle x1="-5.715" y1="-4.445" x2="5.715" y2="8.255" layer="43"/>
</package>
<package name="HC49U-H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-5.08" y1="-3.175" x2="5.08" y2="-3.175" width="0.8128" layer="21"/>
<wire x1="4.445" y1="9.906" x2="-4.445" y2="9.906" width="0.1524" layer="21"/>
<wire x1="4.445" y1="9.906" x2="5.08" y2="9.271" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="9.271" x2="-4.445" y2="9.906" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.3302" y1="8.255" x2="-0.3302" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="5.715" x2="0.3048" y2="5.715" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="5.715" x2="0.3048" y2="8.255" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="8.255" x2="-0.3302" y2="8.255" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="8.255" x2="0.9398" y2="6.985" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="8.255" x2="-0.9398" y2="6.985" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="6.985" x2="1.905" y2="6.985" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="6.985" x2="0.9398" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="6.985" x2="-1.905" y2="6.985" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="6.985" x2="-0.9398" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-2.413" y1="-3.302" x2="-2.413" y2="-5.08" width="0.6096" layer="51"/>
<wire x1="2.413" y1="-3.302" x2="2.413" y2="-5.08" width="0.6096" layer="51"/>
<wire x1="5.08" y1="-3.175" x2="5.08" y2="9.271" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="9.271" x2="-5.08" y2="-3.175" width="0.1524" layer="21"/>
<pad name="1" x="-2.413" y="-5.08" drill="0.8128"/>
<pad name="2" x="2.413" y="-5.08" drill="0.8128"/>
<text x="-5.461" y="-1.397" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-2.54" y="-2.032" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-6.35" y1="-4.445" x2="6.35" y2="-1.905" layer="43"/>
<rectangle x1="-5.715" y1="-1.905" x2="5.715" y2="10.795" layer="43"/>
</package>
<package name="HC49U-LM">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-5.08" y1="-3.175" x2="5.08" y2="-3.175" width="0.8128" layer="21"/>
<wire x1="4.445" y1="9.906" x2="-4.445" y2="9.906" width="0.1524" layer="21"/>
<wire x1="4.445" y1="9.906" x2="5.08" y2="9.271" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="9.271" x2="-4.445" y2="9.906" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.572" y1="3.81" x2="4.572" y2="3.81" width="0.6096" layer="21"/>
<wire x1="-0.3302" y1="8.255" x2="-0.3302" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="5.715" x2="0.3048" y2="5.715" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="5.715" x2="0.3048" y2="8.255" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="8.255" x2="-0.3302" y2="8.255" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="8.255" x2="0.9398" y2="6.985" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="8.255" x2="-0.9398" y2="6.985" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="6.985" x2="2.54" y2="6.985" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="6.985" x2="0.9398" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="6.985" x2="-2.54" y2="6.985" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="6.985" x2="-0.9398" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-2.413" y1="-3.302" x2="-2.413" y2="-5.08" width="0.6096" layer="51"/>
<wire x1="2.413" y1="-3.302" x2="2.413" y2="-5.08" width="0.6096" layer="51"/>
<wire x1="5.08" y1="3.048" x2="5.08" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.572" x2="5.08" y2="9.271" width="0.1524" layer="21"/>
<wire x1="4.572" y1="3.81" x2="5.08" y2="3.81" width="0.6096" layer="51"/>
<wire x1="5.08" y1="3.81" x2="5.715" y2="3.81" width="0.6096" layer="51"/>
<wire x1="5.08" y1="3.81" x2="5.08" y2="3.048" width="0.1524" layer="51"/>
<wire x1="5.08" y1="3.81" x2="5.08" y2="4.572" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="3.175" x2="-5.08" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.445" x2="-5.08" y2="9.271" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="3.81" x2="-5.715" y2="3.81" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="4.445" x2="-5.08" y2="3.175" width="0.1524" layer="51"/>
<pad name="1" x="-2.413" y="-5.08" drill="0.8128"/>
<pad name="2" x="2.413" y="-5.08" drill="0.8128"/>
<pad name="M" x="-5.715" y="3.81" drill="0.8128"/>
<pad name="M1" x="5.715" y="3.81" drill="0.8128"/>
<text x="-5.08" y="10.414" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.572" y="0" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.715" y1="-5.08" x2="5.715" y2="10.795" layer="43"/>
</package>
<package name="HC49U-V">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-2.921" y1="-2.286" x2="2.921" y2="-2.286" width="0.4064" layer="21"/>
<wire x1="-2.921" y1="2.286" x2="2.921" y2="2.286" width="0.4064" layer="21"/>
<wire x1="-2.921" y1="-1.778" x2="2.921" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.778" x2="-2.921" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.778" x2="2.921" y2="-1.778" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.921" y1="2.286" x2="2.921" y2="-2.286" width="0.4064" layer="21" curve="-180"/>
<wire x1="-2.921" y1="2.286" x2="-2.921" y2="-2.286" width="0.4064" layer="21" curve="180"/>
<wire x1="-2.921" y1="1.778" x2="-2.921" y2="-1.778" width="0.1524" layer="21" curve="180"/>
<wire x1="-0.254" y1="0.889" x2="0.254" y2="0.889" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.889" x2="0.254" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.889" x2="-0.254" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.889" x2="-0.254" y2="0.889" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0.889" x2="0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.889" x2="-0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="1.27" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-2.413" y="0" drill="0.8128"/>
<pad name="2" x="2.413" y="0" drill="0.8128"/>
<text x="-5.08" y="2.921" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.81" y1="-2.794" x2="3.81" y2="2.794" layer="43"/>
<rectangle x1="-4.318" y1="-2.54" x2="-3.81" y2="2.54" layer="43"/>
<rectangle x1="-4.826" y1="-2.286" x2="-4.318" y2="2.286" layer="43"/>
<rectangle x1="-5.334" y1="-1.778" x2="-4.826" y2="1.778" layer="43"/>
<rectangle x1="-5.588" y1="-1.27" x2="-5.334" y2="1.016" layer="43"/>
<rectangle x1="3.81" y1="-2.54" x2="4.318" y2="2.54" layer="43"/>
<rectangle x1="4.318" y1="-2.286" x2="4.826" y2="2.286" layer="43"/>
<rectangle x1="4.826" y1="-1.778" x2="5.334" y2="1.778" layer="43"/>
<rectangle x1="5.334" y1="-1.016" x2="5.588" y2="1.016" layer="43"/>
</package>
<package name="HC49U70">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-3.048" y1="-2.54" x2="3.048" y2="-2.54" width="0.4064" layer="21"/>
<wire x1="-3.048" y1="2.54" x2="3.048" y2="2.54" width="0.4064" layer="21"/>
<wire x1="-3.048" y1="-2.032" x2="3.048" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-0.3302" y1="1.016" x2="-0.3302" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-0.3302" y1="-1.016" x2="0.3048" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="0.3048" y1="-1.016" x2="0.3048" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.3048" y1="1.016" x2="-0.3302" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.6858" y1="1.016" x2="0.6858" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.6858" y1="1.016" x2="-0.6858" y2="0" width="0.1524" layer="21"/>
<wire x1="0.6858" y1="0" x2="1.397" y2="0" width="0.1524" layer="21"/>
<wire x1="0.6858" y1="0" x2="0.6858" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-0.6858" y1="0" x2="-1.397" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.6858" y1="0" x2="-0.6858" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.54" x2="-3.048" y2="-2.54" width="0.4064" layer="21" curve="180"/>
<wire x1="3.048" y1="2.54" x2="3.048" y2="-2.54" width="0.4064" layer="21" curve="-180"/>
<wire x1="-3.048" y1="-2.032" x2="-3.048" y2="2.032" width="0.1524" layer="21" curve="-180"/>
<wire x1="3.048" y1="2.032" x2="3.048" y2="-2.032" width="0.1524" layer="21" curve="-180"/>
<wire x1="3.048" y1="2.032" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-2.413" y="0" drill="0.8128"/>
<pad name="2" x="2.413" y="0" drill="0.8128"/>
<text x="-5.08" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.572" y1="-2.794" x2="-4.064" y2="2.794" layer="43"/>
<rectangle x1="-5.08" y1="-2.54" x2="-4.572" y2="2.54" layer="43"/>
<rectangle x1="-5.588" y1="-2.032" x2="-5.08" y2="2.032" layer="43"/>
<rectangle x1="-5.842" y1="-1.27" x2="-5.588" y2="1.27" layer="43"/>
<rectangle x1="-4.064" y1="-3.048" x2="4.064" y2="3.048" layer="43"/>
<rectangle x1="4.064" y1="-2.794" x2="4.572" y2="2.794" layer="43"/>
<rectangle x1="4.572" y1="-2.54" x2="5.08" y2="2.54" layer="43"/>
<rectangle x1="5.08" y1="-2.032" x2="5.588" y2="2.032" layer="43"/>
<rectangle x1="5.588" y1="-1.27" x2="5.842" y2="1.27" layer="43"/>
</package>
<package name="HC49UP">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-5.1091" y1="1.143" x2="-3.429" y2="2.0321" width="0.0508" layer="21" curve="-55.770993"/>
<wire x1="-5.715" y1="1.143" x2="-5.715" y2="2.159" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.032" x2="5.1091" y2="1.143" width="0.0508" layer="21" curve="-55.772485"/>
<wire x1="5.715" y1="1.143" x2="5.715" y2="2.159" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="-3.429" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="3.429" y1="-2.032" x2="-3.429" y2="-2.032" width="0.0508" layer="21"/>
<wire x1="-3.429" y1="1.27" x2="3.429" y2="1.27" width="0.0508" layer="21"/>
<wire x1="5.461" y1="-2.413" x2="-5.461" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-0.381" x2="6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="5.715" y1="0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="6.477" y1="-0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="5.461" y1="-2.413" x2="5.715" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="5.715" y1="-1.143" x2="5.715" y2="1.143" width="0.1524" layer="51"/>
<wire x1="5.715" y1="-2.159" x2="5.715" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="3.9826" y2="-1.143" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="3.429" y1="1.27" x2="3.9826" y2="1.143" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="3.429" y1="-2.032" x2="5.109" y2="-1.1429" width="0.0508" layer="21" curve="55.771157"/>
<wire x1="3.9826" y1="-1.143" x2="3.9826" y2="1.143" width="0.0508" layer="51" curve="128.314524"/>
<wire x1="5.1091" y1="-1.143" x2="5.1091" y2="1.143" width="0.0508" layer="51" curve="68.456213"/>
<wire x1="-5.1091" y1="-1.143" x2="-3.429" y2="-2.032" width="0.0508" layer="21" curve="55.772485"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.9826" y2="1.143" width="0.0508" layer="51" curve="-128.314524"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.429" y2="-1.27" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="-3.9826" y1="1.143" x2="-3.429" y2="1.27" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="-6.477" y1="-0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.1091" y1="-1.143" x2="-5.1091" y2="1.143" width="0.0508" layer="51" curve="-68.456213"/>
<wire x1="-5.715" y1="-1.143" x2="-5.715" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-0.381" x2="-5.715" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="0.381" x2="-5.715" y2="1.143" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-2.159" x2="-5.715" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.159" x2="-5.461" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.715" y1="-0.381" x2="-6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="2.032" x2="3.429" y2="2.032" width="0.0508" layer="21"/>
<wire x1="5.461" y1="2.413" x2="-5.461" y2="2.413" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.413" x2="5.715" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.715" y1="2.159" x2="-5.461" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.254" y1="0.635" x2="-0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.635" x2="0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.635" x2="0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.635" x2="-0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.016" y2="0" width="0.0508" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="1.016" y2="0" width="0.0508" layer="21"/>
<smd name="1" x="-4.826" y="0" dx="5.334" dy="1.9304" layer="1"/>
<smd name="2" x="4.826" y="0" dx="5.334" dy="1.9304" layer="1"/>
<text x="-5.715" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.604" y1="-3.048" x2="6.604" y2="3.048" layer="43"/>
</package>
<package name="HC13U-H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-9.906" y1="-3.048" x2="-9.271" y2="-3.048" width="1.27" layer="21"/>
<wire x1="-9.271" y1="-3.048" x2="9.271" y2="-3.048" width="1.27" layer="21"/>
<wire x1="9.271" y1="-3.048" x2="9.906" y2="-3.048" width="1.27" layer="21"/>
<wire x1="8.636" y1="33.401" x2="-8.636" y2="33.401" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="32.766" x2="-8.636" y2="33.401" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.636" y1="33.401" x2="9.271" y2="32.766" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.017" y1="15.24" x2="9.017" y2="15.24" width="0.6096" layer="21"/>
<wire x1="-0.3302" y1="21.59" x2="-0.3302" y2="19.05" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="19.05" x2="0.3048" y2="19.05" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="19.05" x2="0.3048" y2="21.59" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="21.59" x2="-0.3302" y2="21.59" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="21.59" x2="0.9398" y2="20.32" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="21.59" x2="-0.9398" y2="20.32" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="20.32" x2="1.905" y2="20.32" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="20.32" x2="0.9398" y2="19.05" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="20.32" x2="-1.905" y2="20.32" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="20.32" x2="-0.9398" y2="19.05" width="0.3048" layer="21"/>
<wire x1="9.144" y1="15.24" x2="10.16" y2="15.24" width="0.6096" layer="51"/>
<wire x1="-10.16" y1="15.24" x2="-9.144" y2="15.24" width="0.6096" layer="51"/>
<wire x1="-6.223" y1="-3.175" x2="-6.223" y2="-5.08" width="0.8128" layer="51"/>
<wire x1="6.223" y1="-3.175" x2="6.223" y2="-5.08" width="0.8128" layer="51"/>
<wire x1="9.271" y1="15.748" x2="9.271" y2="32.766" width="0.1524" layer="21"/>
<wire x1="9.271" y1="14.732" x2="9.271" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="9.271" y1="15.748" x2="9.271" y2="14.732" width="0.1524" layer="51"/>
<wire x1="-9.271" y1="14.732" x2="-9.271" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="15.748" x2="-9.271" y2="32.766" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="15.748" x2="-9.271" y2="14.732" width="0.1524" layer="51"/>
<pad name="1" x="-6.223" y="-5.08" drill="1.016"/>
<pad name="2" x="6.223" y="-5.08" drill="1.016"/>
<pad name="M" x="-10.16" y="15.24" drill="0.8128"/>
<pad name="M1" x="10.16" y="15.24" drill="0.8128"/>
<text x="-10.16" y="0" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-5.08" y="-1.27" size="1.778" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-5.08" x2="10.795" y2="34.925" layer="43"/>
</package>
<package name="HC18U-H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="5.461" y1="-3.175" x2="5.08" y2="-3.175" width="0.8128" layer="21"/>
<wire x1="5.08" y1="-3.175" x2="-5.08" y2="-3.175" width="0.8128" layer="21"/>
<wire x1="-5.08" y1="-3.175" x2="-5.461" y2="-3.175" width="0.8128" layer="21"/>
<wire x1="4.445" y1="10.16" x2="-4.445" y2="10.16" width="0.1524" layer="21"/>
<wire x1="4.445" y1="10.16" x2="5.08" y2="9.525" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="9.525" x2="-4.445" y2="10.16" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.572" y1="3.81" x2="4.572" y2="3.81" width="0.6096" layer="21"/>
<wire x1="-0.3302" y1="8.255" x2="-0.3302" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="5.715" x2="0.3048" y2="5.715" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="5.715" x2="0.3048" y2="8.255" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="8.255" x2="-0.3302" y2="8.255" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="8.255" x2="0.9398" y2="6.985" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="8.255" x2="-0.9398" y2="6.985" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="6.985" x2="2.54" y2="6.985" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="6.985" x2="0.9398" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="6.985" x2="-2.54" y2="6.985" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="6.985" x2="-0.9398" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-2.54" y1="-3.302" x2="-2.54" y2="-5.08" width="0.6096" layer="51"/>
<wire x1="2.54" y1="-3.302" x2="2.54" y2="-5.08" width="0.6096" layer="51"/>
<wire x1="5.08" y1="3.048" x2="5.08" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.572" x2="5.08" y2="9.525" width="0.1524" layer="21"/>
<wire x1="4.572" y1="3.81" x2="5.08" y2="3.81" width="0.6096" layer="51"/>
<wire x1="5.08" y1="3.81" x2="5.715" y2="3.81" width="0.6096" layer="51"/>
<wire x1="5.08" y1="3.81" x2="5.08" y2="3.048" width="0.1524" layer="51"/>
<wire x1="5.08" y1="3.81" x2="5.08" y2="4.572" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="3.175" x2="-5.08" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.445" x2="-5.08" y2="9.525" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="3.81" x2="-5.715" y2="3.81" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="4.445" x2="-5.08" y2="3.175" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="-5.08" drill="0.8128"/>
<pad name="2" x="2.54" y="-5.08" drill="0.8128"/>
<pad name="M" x="-5.715" y="3.81" drill="0.8128"/>
<pad name="M1" x="5.715" y="3.81" drill="0.8128"/>
<text x="-5.08" y="10.668" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-0.889" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.35" y1="-5.08" x2="6.35" y2="10.795" layer="43"/>
</package>
<package name="HC18U-V">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="1.905" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="4.445" y2="2.54" width="0.4064" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="4.445" y2="-2.54" width="0.4064" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.08" y2="-1.905" width="0.4064" layer="21" curve="90"/>
<wire x1="4.445" y1="2.54" x2="5.08" y2="1.905" width="0.4064" layer="21" curve="-90"/>
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="2.54" width="0.4064" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.905" x2="-4.445" y2="-2.54" width="0.4064" layer="21" curve="90"/>
<wire x1="-4.318" y1="-1.905" x2="4.318" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.905" x2="4.445" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.778" x2="4.445" y2="1.778" width="0.1524" layer="21"/>
<wire x1="4.318" y1="1.905" x2="4.445" y2="1.778" width="0.1524" layer="21"/>
<wire x1="4.318" y1="1.905" x2="-4.318" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.778" x2="-4.318" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.778" x2="-4.445" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-1.905" x2="-4.445" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-0.3302" y1="1.27" x2="-0.3302" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="-1.27" x2="0.3048" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="-1.27" x2="0.3048" y2="1.27" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="1.27" x2="-0.3302" y2="1.27" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="1.27" x2="0.9398" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="1.27" x2="-0.9398" y2="0" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="0" x2="0.9398" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="0" x2="-0.9398" y2="-1.27" width="0.3048" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="0.8128"/>
<pad name="2" x="2.54" y="0" drill="0.8128"/>
<text x="-5.0546" y="3.2766" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.6228" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.715" y1="-3.175" x2="5.715" y2="3.175" layer="43"/>
</package>
<package name="HC33U-H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-9.906" y1="-3.048" x2="-9.271" y2="-3.048" width="1.27" layer="21"/>
<wire x1="-9.271" y1="-3.048" x2="9.271" y2="-3.048" width="1.27" layer="21"/>
<wire x1="9.271" y1="-3.048" x2="9.906" y2="-3.048" width="1.27" layer="21"/>
<wire x1="8.636" y1="16.51" x2="-8.636" y2="16.51" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="15.875" x2="-8.636" y2="16.51" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.636" y1="16.51" x2="9.271" y2="15.875" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.017" y1="7.62" x2="9.017" y2="7.62" width="0.6096" layer="21"/>
<wire x1="-0.3302" y1="13.97" x2="-0.3302" y2="11.43" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="11.43" x2="0.3048" y2="11.43" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="11.43" x2="0.3048" y2="13.97" width="0.3048" layer="21"/>
<wire x1="0.3048" y1="13.97" x2="-0.3302" y2="13.97" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="13.97" x2="0.9398" y2="12.7" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="13.97" x2="-0.9398" y2="12.7" width="0.3048" layer="21"/>
<wire x1="0.9398" y1="12.7" x2="1.905" y2="12.7" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="12.7" x2="0.9398" y2="11.43" width="0.3048" layer="21"/>
<wire x1="-0.9398" y1="12.7" x2="-1.905" y2="12.7" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="12.7" x2="-0.9398" y2="11.43" width="0.3048" layer="21"/>
<wire x1="9.144" y1="7.62" x2="10.16" y2="7.62" width="0.6096" layer="51"/>
<wire x1="-10.16" y1="7.62" x2="-9.144" y2="7.62" width="0.6096" layer="51"/>
<wire x1="-6.223" y1="-3.175" x2="-6.223" y2="-5.08" width="0.8128" layer="51"/>
<wire x1="6.223" y1="-3.175" x2="6.223" y2="-5.08" width="0.8128" layer="51"/>
<wire x1="9.271" y1="8.128" x2="9.271" y2="15.875" width="0.1524" layer="21"/>
<wire x1="9.271" y1="7.112" x2="9.271" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="9.271" y1="8.128" x2="9.271" y2="7.112" width="0.1524" layer="51"/>
<wire x1="-9.271" y1="7.112" x2="-9.271" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="8.128" x2="-9.271" y2="15.875" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="8.128" x2="-9.271" y2="7.112" width="0.1524" layer="51"/>
<pad name="1" x="-6.223" y="-5.08" drill="1.016"/>
<pad name="2" x="6.223" y="-5.08" drill="1.016"/>
<pad name="M" x="-10.16" y="7.62" drill="0.8128"/>
<pad name="M1" x="10.16" y="7.62" drill="0.8128"/>
<text x="-7.62" y="17.272" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-7.62" y1="-3.175" x2="-6.985" y2="16.51" layer="21"/>
<rectangle x1="6.985" y1="-3.175" x2="7.62" y2="16.51" layer="21"/>
<rectangle x1="-10.795" y1="-5.715" x2="10.795" y2="17.145" layer="43"/>
</package>
<package name="HC33U-V">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-0.3302" y1="2.54" x2="-0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3302" y1="0" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="2.54" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="2.54" x2="-0.3302" y2="2.54" width="0.3048" layer="21"/>
<wire x1="0.9652" y1="2.54" x2="0.9652" y2="1.27" width="0.3048" layer="21"/>
<wire x1="-0.9652" y1="2.54" x2="-0.9652" y2="1.27" width="0.3048" layer="21"/>
<wire x1="0.9652" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.9652" y1="1.27" x2="0.9652" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.9652" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.9652" y1="1.27" x2="-0.9652" y2="0" width="0.3048" layer="21"/>
<wire x1="-5.207" y1="4.064" x2="5.207" y2="4.064" width="0.254" layer="21"/>
<wire x1="-5.207" y1="-4.064" x2="5.207" y2="-4.064" width="0.254" layer="21"/>
<wire x1="-5.207" y1="-3.683" x2="5.207" y2="-3.683" width="0.0508" layer="21"/>
<wire x1="-5.207" y1="3.683" x2="5.207" y2="3.683" width="0.0508" layer="21"/>
<wire x1="-5.207" y1="-3.683" x2="-5.207" y2="3.683" width="0.0508" layer="21" curve="-180"/>
<wire x1="5.207" y1="3.683" x2="5.207" y2="-3.683" width="0.0508" layer="21" curve="-180"/>
<wire x1="5.207" y1="4.064" x2="5.207" y2="-4.064" width="0.254" layer="21" curve="-180"/>
<wire x1="-5.207" y1="4.064" x2="-5.207" y2="-4.064" width="0.254" layer="21" curve="180"/>
<pad name="1" x="-6.223" y="0" drill="1.016"/>
<pad name="2" x="6.223" y="0" drill="1.016"/>
<text x="-5.08" y="4.826" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-8.255" y1="-3.81" x2="-6.985" y2="3.81" layer="43"/>
<rectangle x1="-8.89" y1="-3.175" x2="-8.255" y2="3.175" layer="43"/>
<rectangle x1="-9.525" y1="-2.54" x2="-8.89" y2="2.54" layer="43"/>
<rectangle x1="-6.985" y1="-4.445" x2="6.985" y2="4.445" layer="43"/>
<rectangle x1="6.985" y1="-3.81" x2="8.255" y2="3.81" layer="43"/>
<rectangle x1="8.255" y1="-3.175" x2="8.89" y2="3.175" layer="43"/>
<rectangle x1="8.89" y1="-2.54" x2="9.525" y2="2.54" layer="43"/>
</package>
<package name="SM49">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="3.429" y1="-2.032" x2="5.109" y2="-1.1429" width="0.0508" layer="21" curve="55.771157"/>
<wire x1="5.715" y1="-1.143" x2="5.715" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-5.1091" y1="-1.143" x2="-3.429" y2="-2.032" width="0.0508" layer="21" curve="55.772485"/>
<wire x1="-5.715" y1="-1.143" x2="-5.715" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="1.27" x2="3.429" y2="1.27" width="0.0508" layer="21"/>
<wire x1="-3.429" y1="2.032" x2="3.429" y2="2.032" width="0.0508" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="-3.429" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-5.461" y1="2.413" x2="5.461" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-0.381" x2="-6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="0.381" x2="-6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="2.159" x2="-5.461" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.715" y1="1.143" x2="-5.715" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="2.159" x2="-5.715" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-3.9826" y1="1.143" x2="-3.429" y2="1.27" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.429" y2="-1.27" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="-5.1091" y1="1.143" x2="-3.429" y2="2.0321" width="0.0508" layer="21" curve="-55.770993"/>
<wire x1="-3.9826" y1="1.143" x2="-3.9826" y2="-1.143" width="0.0508" layer="51" curve="128.314524"/>
<wire x1="-5.1091" y1="1.143" x2="-5.1091" y2="-1.143" width="0.0508" layer="51" curve="68.456213"/>
<wire x1="3.429" y1="2.032" x2="5.1091" y2="1.143" width="0.0508" layer="21" curve="-55.772485"/>
<wire x1="3.9826" y1="1.143" x2="3.9826" y2="-1.143" width="0.0508" layer="51" curve="-128.314524"/>
<wire x1="3.429" y1="1.27" x2="3.9826" y2="1.143" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="3.429" y1="-1.27" x2="3.9826" y2="-1.143" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="6.477" y1="0.381" x2="6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="5.1091" y1="1.143" x2="5.1091" y2="-1.143" width="0.0508" layer="51" curve="-68.456213"/>
<wire x1="5.715" y1="1.143" x2="5.715" y2="0.381" width="0.1524" layer="51"/>
<wire x1="5.715" y1="0.381" x2="5.715" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="5.715" y1="-0.381" x2="5.715" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="5.715" y1="2.159" x2="5.715" y2="1.143" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.413" x2="5.715" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="5.715" y1="0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="5.715" y1="-0.381" x2="6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-2.032" x2="-3.429" y2="-2.032" width="0.0508" layer="21"/>
<wire x1="-5.461" y1="-2.413" x2="5.461" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.159" x2="-5.461" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<wire x1="5.461" y1="-2.413" x2="5.715" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="-0.254" y1="0.635" x2="-0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.635" x2="0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.635" x2="0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.635" x2="-0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.143" y2="0" width="0.0508" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="1.143" y2="0" width="0.0508" layer="21"/>
<smd name="1" x="-4.826" y="0" dx="5.08" dy="1.778" layer="1"/>
<smd name="2" x="4.826" y="0" dx="5.08" dy="1.778" layer="1"/>
<text x="-5.715" y="2.667" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-4.064" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.604" y1="-2.54" x2="6.604" y2="2.794" layer="43"/>
</package>
<package name="TC26H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-0.889" y1="1.651" x2="0.889" y2="1.651" width="0.1524" layer="21"/>
<wire x1="0.762" y1="7.747" x2="1.016" y2="7.493" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.016" y1="7.493" x2="-0.762" y2="7.747" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.762" y1="7.747" x2="0.762" y2="7.747" width="0.1524" layer="21"/>
<wire x1="0.889" y1="1.651" x2="0.889" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.032" x2="1.016" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="1.651" x2="-0.889" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.032" x2="-0.889" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.032" x2="-1.016" y2="7.493" width="0.1524" layer="21"/>
<wire x1="0.508" y1="0.762" x2="0.508" y2="1.143" width="0.4064" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="1.27" width="0.4064" layer="21"/>
<wire x1="0.635" y1="0.635" x2="1.27" y2="0" width="0.4064" layer="51"/>
<wire x1="-0.635" y1="0.635" x2="-1.27" y2="0" width="0.4064" layer="51"/>
<wire x1="-0.508" y1="4.953" x2="-0.508" y2="4.572" width="0.1524" layer="21"/>
<wire x1="0.508" y1="4.572" x2="-0.508" y2="4.572" width="0.1524" layer="21"/>
<wire x1="0.508" y1="4.572" x2="0.508" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="4.953" x2="0.508" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="5.334" x2="0" y2="5.334" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="4.191" x2="0" y2="4.191" width="0.1524" layer="21"/>
<wire x1="0" y1="4.191" x2="0" y2="3.683" width="0.1524" layer="21"/>
<wire x1="0" y1="4.191" x2="0.508" y2="4.191" width="0.1524" layer="21"/>
<wire x1="0" y1="5.334" x2="0" y2="5.842" width="0.1524" layer="21"/>
<wire x1="0" y1="5.334" x2="0.508" y2="5.334" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.032" x2="0.889" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.889" y1="2.032" x2="-0.889" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="0.8128"/>
<pad name="2" x="1.27" y="0" drill="0.8128"/>
<text x="-1.397" y="2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="2.667" y="2.032" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="0.3048" y1="1.016" x2="0.7112" y2="1.6002" layer="21"/>
<rectangle x1="-0.7112" y1="1.016" x2="-0.3048" y2="1.6002" layer="21"/>
<rectangle x1="-1.778" y1="0.762" x2="1.778" y2="8.382" layer="43"/>
</package>
<package name="TC26V">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-0.127" y1="-0.508" x2="0.127" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="0.127" y1="0.508" x2="0.127" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="0.127" y1="0.508" x2="-0.127" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-0.127" y1="-0.508" x2="-0.127" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-0.508" x2="-0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="-0.508" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.381" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="0" x2="-0.381" y2="0.508" width="0.1524" layer="51"/>
<wire x1="0" y1="1.016" x2="0.7184" y2="0.7184" width="0.1524" layer="21" curve="-44.999323"/>
<wire x1="-0.7184" y1="0.7184" x2="0" y2="1.016" width="0.1524" layer="21" curve="-44.999323"/>
<wire x1="-0.7184" y1="-0.7184" x2="0" y2="-1.016" width="0.1524" layer="21" curve="44.999323"/>
<wire x1="0" y1="-1.016" x2="0.7184" y2="-0.7184" width="0.1524" layer="21" curve="44.999323"/>
<circle x="0" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128"/>
<pad name="2" x="1.27" y="0" drill="0.8128"/>
<text x="-2.032" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.032" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TC38H">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-1.397" y1="1.651" x2="1.397" y2="1.651" width="0.1524" layer="21"/>
<wire x1="1.27" y1="9.906" x2="1.524" y2="9.652" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.524" y1="9.652" x2="-1.27" y2="9.906" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="9.906" x2="1.27" y2="9.906" width="0.1524" layer="21"/>
<wire x1="1.397" y1="1.651" x2="1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.032" x2="1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.032" x2="1.524" y2="9.652" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="1.651" x2="-1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.032" x2="-1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.032" x2="-1.524" y2="9.652" width="0.1524" layer="21"/>
<wire x1="1.397" y1="2.032" x2="-1.397" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.5588" y1="0.7112" x2="0.508" y2="0.762" width="0.4064" layer="21"/>
<wire x1="0.508" y1="0.762" x2="0.508" y2="1.143" width="0.4064" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="1.016" width="0.4064" layer="21"/>
<wire x1="-0.5588" y1="0.7112" x2="-0.508" y2="0.762" width="0.4064" layer="21"/>
<wire x1="0.635" y1="0.635" x2="1.27" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="0.635" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="5.588" x2="-0.762" y2="5.207" width="0.1524" layer="21"/>
<wire x1="0.762" y1="5.207" x2="-0.762" y2="5.207" width="0.1524" layer="21"/>
<wire x1="0.762" y1="5.207" x2="0.762" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="5.588" x2="0.762" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="5.969" x2="0" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="4.826" x2="0" y2="4.826" width="0.1524" layer="21"/>
<wire x1="0" y1="4.826" x2="0" y2="4.318" width="0.1524" layer="21"/>
<wire x1="0" y1="4.826" x2="0.762" y2="4.826" width="0.1524" layer="21"/>
<wire x1="0" y1="5.969" x2="0" y2="6.477" width="0.1524" layer="21"/>
<wire x1="0" y1="5.969" x2="0.762" y2="5.969" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="0.8128"/>
<pad name="2" x="1.27" y="0" drill="0.8128"/>
<text x="-1.905" y="2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.175" y="2.032" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="0.3048" y1="1.016" x2="0.7112" y2="1.6002" layer="21"/>
<rectangle x1="-0.7112" y1="1.016" x2="-0.3048" y2="1.6002" layer="21"/>
<rectangle x1="-1.778" y1="1.016" x2="1.778" y2="10.414" layer="43"/>
</package>
<package name="86SMX">
<description>&lt;b&gt;CRYSTAL RESONATOR&lt;/b&gt;</description>
<wire x1="-3.81" y1="1.905" x2="2.413" y2="1.905" width="0.0508" layer="21"/>
<wire x1="-3.81" y1="2.286" x2="2.413" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="2.413" y2="-1.905" width="0.0508" layer="21"/>
<wire x1="-3.81" y1="-2.286" x2="2.413" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-2.286" x2="-6.604" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="1.905" x2="-5.334" y2="1.016" width="0.0508" layer="51"/>
<wire x1="-5.334" y1="-1.905" x2="-3.81" y2="-1.905" width="0.0508" layer="51"/>
<wire x1="-6.35" y1="-2.286" x2="-5.969" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="-2.286" x2="-4.191" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-4.191" y1="-2.286" x2="-3.81" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="-2.54" x2="-4.191" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-6.35" y1="-2.2098" x2="-6.604" y2="-2.286" width="0.0508" layer="21"/>
<wire x1="-6.604" y1="-2.286" x2="-6.35" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="-2.54" x2="-5.969" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-5.334" y1="1.016" x2="-5.334" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="-5.334" y1="-1.016" x2="-5.334" y2="-1.905" width="0.0508" layer="51"/>
<wire x1="-5.334" y1="-1.905" x2="-6.35" y2="-2.2098" width="0.0508" layer="51"/>
<wire x1="-4.191" y1="-2.54" x2="-4.191" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="2.54" x2="-4.191" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-5.334" y1="1.905" x2="-3.81" y2="1.905" width="0.0508" layer="51"/>
<wire x1="-6.35" y1="2.286" x2="-5.969" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="2.286" x2="-4.191" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-4.191" y1="2.286" x2="-3.81" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-6.604" y1="2.286" x2="-6.35" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="2.2098" x2="-6.604" y2="2.286" width="0.0508" layer="21"/>
<wire x1="-5.969" y1="2.54" x2="-5.969" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-5.334" y1="1.905" x2="-6.35" y2="2.2098" width="0.0508" layer="51"/>
<wire x1="-4.191" y1="2.54" x2="-4.191" y2="2.286" width="0.1524" layer="51"/>
<wire x1="6.604" y1="2.286" x2="6.604" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="6.223" y1="-1.905" x2="6.223" y2="1.905" width="0.0508" layer="21"/>
<wire x1="6.223" y1="-1.905" x2="6.604" y2="-2.286" width="0.0508" layer="21"/>
<wire x1="6.223" y1="-2.286" x2="6.604" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-2.54" x2="5.842" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="2.794" y1="-2.286" x2="2.794" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="5.842" y1="-2.54" x2="5.842" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-2.286" x2="6.223" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.905" x2="6.223" y2="-1.905" width="0.0508" layer="51"/>
<wire x1="6.223" y1="1.905" x2="6.604" y2="2.286" width="0.0508" layer="21"/>
<wire x1="6.223" y1="2.286" x2="6.604" y2="2.286" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.54" x2="5.842" y2="2.54" width="0.1524" layer="51"/>
<wire x1="2.794" y1="2.286" x2="2.794" y2="2.54" width="0.1524" layer="51"/>
<wire x1="5.842" y1="2.54" x2="5.842" y2="2.286" width="0.1524" layer="51"/>
<wire x1="2.413" y1="1.905" x2="6.223" y2="1.905" width="0.0508" layer="51"/>
<wire x1="2.413" y1="2.286" x2="6.223" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-0.254" y1="1.651" x2="-0.254" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="0.381" x2="0.254" y2="0.381" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.381" x2="0.254" y2="1.651" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.651" x2="-0.254" y2="1.651" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.651" x2="0.635" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.016" x2="0.635" y2="0.381" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.016" x2="1.016" y2="1.016" width="0.0508" layer="21"/>
<wire x1="-0.635" y1="1.651" x2="-0.635" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.016" x2="-0.635" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.016" x2="-1.016" y2="1.016" width="0.0508" layer="21"/>
<smd name="2" x="4.318" y="-2.286" dx="3.556" dy="2.1844" layer="1"/>
<smd name="3" x="4.318" y="2.286" dx="3.556" dy="2.1844" layer="1"/>
<smd name="1" x="-5.08" y="-2.286" dx="2.286" dy="2.1844" layer="1"/>
<smd name="4" x="-5.08" y="2.286" dx="2.286" dy="2.1844" layer="1"/>
<text x="-3.683" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.683" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="MM20SS">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-2.032" y1="-1.27" x2="2.032" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="-2.032" y1="-1.778" x2="2.032" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="2.032" y1="1.27" x2="-2.032" y2="1.27" width="0.0508" layer="21"/>
<wire x1="-2.032" y1="1.778" x2="2.032" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.778" x2="-4.064" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="0.381" x2="-2.921" y2="-0.381" width="0.0508" layer="21"/>
<wire x1="-4.064" y1="-1.778" x2="-3.556" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-1.552" x2="-4.064" y2="-1.778" width="0.0508" layer="21"/>
<wire x1="-2.032" y1="1.27" x2="-2.921" y2="1.27" width="0.0508" layer="51"/>
<wire x1="-2.921" y1="1.27" x2="-2.921" y2="0.381" width="0.0508" layer="51"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="-3.048" y1="-1.905" x2="-3.048" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="-3.048" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-2.921" y1="-0.381" x2="-2.921" y2="-1.27" width="0.0508" layer="51"/>
<wire x1="-2.921" y1="-1.27" x2="-2.032" y2="-1.27" width="0.0508" layer="51"/>
<wire x1="-3.556" y1="-1.778" x2="-2.032" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="-2.921" y1="-1.27" x2="-3.556" y2="-1.552" width="0.0508" layer="51"/>
<wire x1="-4.064" y1="1.778" x2="-3.556" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="1.552" x2="-4.064" y2="1.778" width="0.0508" layer="21"/>
<wire x1="-2.921" y1="1.27" x2="-3.556" y2="1.552" width="0.0508" layer="51"/>
<wire x1="-3.048" y1="1.778" x2="-3.048" y2="1.905" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="1.778" width="0.1524" layer="51"/>
<wire x1="-3.048" y1="1.905" x2="-2.54" y2="1.905" width="0.1524" layer="51"/>
<wire x1="-3.556" y1="1.778" x2="-2.032" y2="1.778" width="0.1524" layer="51"/>
<wire x1="4.064" y1="-1.778" x2="4.064" y2="1.778" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="4.064" y2="-1.778" width="0.0508" layer="21"/>
<wire x1="3.556" y1="-1.27" x2="3.81" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="3.556" y1="-1.778" x2="4.064" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.556" y2="1.27" width="0.0508" layer="21"/>
<wire x1="3.556" y1="1.27" x2="2.032" y2="1.27" width="0.0508" layer="51"/>
<wire x1="3.048" y1="-1.905" x2="3.048" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.778" x2="2.54" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.905" x2="3.048" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-1.27" x2="3.556" y2="-1.27" width="0.0508" layer="51"/>
<wire x1="2.032" y1="-1.778" x2="3.556" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="3.81" y1="1.27" x2="4.064" y2="1.778" width="0.0508" layer="21"/>
<wire x1="3.556" y1="1.778" x2="4.064" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="1.778" width="0.1524" layer="51"/>
<wire x1="3.048" y1="1.778" x2="3.048" y2="1.905" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.905" x2="3.048" y2="1.905" width="0.1524" layer="51"/>
<wire x1="2.032" y1="1.778" x2="3.556" y2="1.778" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="-0.254" x2="-0.508" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="-0.254" x2="-0.508" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0.254" x2="-1.778" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="0.254" x2="-1.778" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="0.635" x2="-1.143" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0.635" x2="-0.508" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0.635" x2="-1.143" y2="1.016" width="0.0508" layer="21"/>
<wire x1="-1.778" y1="-0.635" x2="-1.143" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.635" x2="-0.508" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.635" x2="-1.143" y2="-1.016" width="0.0508" layer="21"/>
<circle x="3.048" y="0" radius="0.254" width="0.1524" layer="21"/>
<smd name="1" x="-2.794" y="-1.524" dx="1.27" dy="1.8796" layer="1"/>
<smd name="2" x="2.794" y="-1.524" dx="1.27" dy="1.8796" layer="1"/>
<smd name="3" x="2.794" y="1.524" dx="1.27" dy="1.8796" layer="1"/>
<smd name="4" x="-2.794" y="1.524" dx="1.27" dy="1.8796" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="MM39SL">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-3.683" y1="-1.651" x2="3.683" y2="-1.651" width="0.0508" layer="21"/>
<wire x1="-3.683" y1="-2.286" x2="3.683" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.286" x2="3.683" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.683" y1="1.651" x2="-3.683" y2="1.651" width="0.0508" layer="21"/>
<wire x1="-6.223" y1="-2.286" x2="-6.223" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="1.651" x2="-4.826" y2="0.762" width="0.0508" layer="51"/>
<wire x1="-5.715" y1="-2.286" x2="-3.683" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-4.826" y1="-1.651" x2="-3.683" y2="-1.651" width="0.0508" layer="51"/>
<wire x1="-5.715" y1="-2.055" x2="-6.223" y2="-2.286" width="0.0508" layer="21"/>
<wire x1="-6.223" y1="-2.286" x2="-5.715" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="0.762" x2="-4.826" y2="-0.762" width="0.0508" layer="21"/>
<wire x1="-4.826" y1="-0.762" x2="-4.826" y2="-1.651" width="0.0508" layer="51"/>
<wire x1="-4.826" y1="-1.651" x2="-5.715" y2="-2.055" width="0.0508" layer="51"/>
<wire x1="-5.715" y1="2.286" x2="-3.683" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-3.683" y1="1.651" x2="-4.826" y2="1.651" width="0.0508" layer="51"/>
<wire x1="-6.223" y1="2.286" x2="-5.715" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.055" x2="-6.223" y2="2.286" width="0.0508" layer="21"/>
<wire x1="-4.826" y1="1.651" x2="-5.715" y2="2.055" width="0.0508" layer="51"/>
<wire x1="6.223" y1="-2.286" x2="6.223" y2="2.286" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-1.651" x2="5.842" y2="1.651" width="0.0508" layer="21"/>
<wire x1="5.842" y1="-1.651" x2="6.223" y2="-2.286" width="0.0508" layer="21"/>
<wire x1="5.715" y1="-2.286" x2="6.223" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.286" x2="5.715" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="5.715" y1="-1.651" x2="5.842" y2="-1.651" width="0.0508" layer="21"/>
<wire x1="3.683" y1="-1.651" x2="5.715" y2="-1.651" width="0.0508" layer="51"/>
<wire x1="5.842" y1="1.651" x2="6.223" y2="2.286" width="0.0508" layer="21"/>
<wire x1="5.842" y1="1.651" x2="5.715" y2="1.651" width="0.0508" layer="21"/>
<wire x1="5.715" y1="2.286" x2="6.223" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.683" y1="2.286" x2="5.715" y2="2.286" width="0.1524" layer="51"/>
<wire x1="5.715" y1="1.651" x2="3.683" y2="1.651" width="0.0508" layer="51"/>
<wire x1="-3.81" y1="-0.254" x2="-2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.254" x2="-2.54" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.254" x2="-3.81" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.254" x2="-3.81" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.175" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0.635" x2="-3.175" y2="1.016" width="0.1016" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-0.635" x2="-3.175" y2="-1.016" width="0.1016" layer="21"/>
<circle x="5.08" y="0" radius="0.254" width="0.1524" layer="21"/>
<smd name="1" x="-4.699" y="-1.778" dx="1.778" dy="1.778" layer="1"/>
<smd name="2" x="4.699" y="-1.778" dx="1.778" dy="1.778" layer="1"/>
<smd name="3" x="4.699" y="1.778" dx="1.778" dy="1.778" layer="1"/>
<smd name="4" x="-4.699" y="1.778" dx="1.778" dy="1.778" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.032" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CTS406">
<description>&lt;b&gt;Model 406 6.0x3.5mm Low Cost Surface Mount Crystal&lt;/b&gt;&lt;p&gt;
Source: 008-0260-0_E.pdf</description>
<wire x1="-2.475" y1="1.65" x2="-1.05" y2="1.65" width="0.2032" layer="51"/>
<wire x1="-1.05" y1="1.65" x2="1.05" y2="1.65" width="0.2032" layer="21"/>
<wire x1="1.05" y1="1.65" x2="2.475" y2="1.65" width="0.2032" layer="51"/>
<wire x1="2.9" y1="1.225" x2="2.9" y2="0.3" width="0.2032" layer="51"/>
<wire x1="2.9" y1="0.3" x2="2.9" y2="-0.3" width="0.2032" layer="21"/>
<wire x1="2.9" y1="-0.3" x2="2.9" y2="-1.225" width="0.2032" layer="51"/>
<wire x1="2.475" y1="-1.65" x2="1.05" y2="-1.65" width="0.2032" layer="51"/>
<wire x1="1.05" y1="-1.65" x2="-1.05" y2="-1.65" width="0.2032" layer="21"/>
<wire x1="-1.05" y1="-1.65" x2="-2.475" y2="-1.65" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="-1.225" x2="-2.9" y2="-0.3" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="-0.3" x2="-2.9" y2="0.3" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="0.3" x2="-2.9" y2="1.225" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="1.225" x2="-2.475" y2="1.65" width="0.2032" layer="51" curve="89.516721"/>
<wire x1="2.475" y1="1.65" x2="2.9" y2="1.225" width="0.2032" layer="51" curve="89.516721"/>
<wire x1="2.9" y1="-1.225" x2="2.475" y2="-1.65" width="0.2032" layer="51" curve="89.516721"/>
<wire x1="-2.475" y1="-1.65" x2="-2.9" y2="-1.225" width="0.2032" layer="51" curve="89.516721"/>
<circle x="-2.05" y="-0.2" radius="0.182" width="0" layer="21"/>
<smd name="1" x="-2.2" y="-1.2" dx="1.9" dy="1.4" layer="1"/>
<smd name="2" x="2.2" y="-1.2" dx="1.9" dy="1.4" layer="1"/>
<smd name="3" x="2.2" y="1.2" dx="1.9" dy="1.4" layer="1"/>
<smd name="4" x="-2.2" y="1.2" dx="1.9" dy="1.4" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="STM32_20PIN_TYP1">
<pin name="PA0-WKUP" x="22.86" y="-17.78" length="middle" rot="R180"/>
<pin name="PA1" x="22.86" y="-15.24" length="middle" rot="R180"/>
<pin name="PA2" x="22.86" y="-12.7" length="middle" rot="R180"/>
<pin name="PA3" x="22.86" y="-10.16" length="middle" rot="R180"/>
<pin name="PA4" x="22.86" y="-7.62" length="middle" rot="R180"/>
<pin name="PA5" x="22.86" y="-5.08" length="middle" rot="R180"/>
<pin name="PA6" x="22.86" y="-2.54" length="middle" rot="R180"/>
<pin name="PA7" x="22.86" y="0" length="middle" rot="R180"/>
<pin name="PA9" x="22.86" y="2.54" length="middle" rot="R180"/>
<pin name="PA10" x="22.86" y="5.08" length="middle" rot="R180"/>
<pin name="PA13" x="22.86" y="7.62" length="middle" rot="R180"/>
<pin name="PA14" x="22.86" y="10.16" length="middle" rot="R180"/>
<pin name="PB1" x="22.86" y="15.24" length="middle" rot="R180"/>
<pin name="VDDA" x="-22.86" y="-10.16" length="middle" direction="pwr"/>
<pin name="BOOT0" x="-22.86" y="-17.78" length="middle" direction="in"/>
<pin name="NRST" x="-22.86" y="-15.24" length="middle" function="dot"/>
<pin name="OSC32_IN" x="-22.86" y="-2.54" length="middle" function="clk"/>
<pin name="OSC32_OUT" x="-22.86" y="-5.08" length="middle" function="clk"/>
<wire x1="-17.78" y1="-20.32" x2="-17.78" y2="20.32" width="0.254" layer="94"/>
<wire x1="-17.78" y1="20.32" x2="17.78" y2="20.32" width="0.254" layer="94"/>
<wire x1="17.78" y1="20.32" x2="17.78" y2="-20.32" width="0.254" layer="94"/>
<wire x1="17.78" y1="-20.32" x2="-17.78" y2="-20.32" width="0.254" layer="94"/>
<text x="-5.08" y="22.86" size="1.778" layer="95">&gt;Name</text>
<text x="-5.08" y="-22.86" size="1.778" layer="96">&gt;Value</text>
</symbol>
<symbol name="PWR_VDD1_VSS1">
<pin name="VDD@1" x="0" y="17.78" length="middle" direction="pwr" rot="R270"/>
<pin name="VSS@1" x="0" y="-17.78" length="middle" direction="pwr" rot="R90"/>
</symbol>
<symbol name="1V2+2">
<wire x1="-1.905" y1="0.635" x2="-1.905" y2="0" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="0" x2="-1.905" y2="-0.635" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="2.54" x2="-0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-2.54" width="0.4064" layer="94"/>
<text x="-2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="-" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
<pin name="+@1" x="2.54" y="0" visible="off" length="point" direction="pas" rot="R180"/>
</symbol>
<symbol name="MCP9700">
<wire x1="-7.62" y1="2.54" x2="7.62" y2="2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="2.54" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="2.54" width="0.254" layer="94"/>
<text x="-2.286" y="-4.064" size="1.524" layer="95">GND</text>
<text x="-7.62" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VDD" x="-10.16" y="0" length="short" direction="in"/>
<pin name="VOUT" x="10.16" y="0" length="short" direction="in" rot="R180"/>
<pin name="GND" x="0" y="-7.62" visible="pad" length="short" direction="pwr" rot="R90"/>
</symbol>
<symbol name="GD25D10B">
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="7.62" width="0.4064" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<pin name="CS" x="-10.16" y="5.08" length="short"/>
<pin name="SO" x="-10.16" y="2.54" length="short"/>
<pin name="WP" x="-10.16" y="0" length="short"/>
<pin name="VSS" x="-10.16" y="-2.54" length="short" direction="pwr"/>
<pin name="VCC" x="10.16" y="5.08" length="short" direction="pwr" rot="R180"/>
<pin name="SCLK" x="10.16" y="0" length="short" rot="R180"/>
<pin name="SI" x="10.16" y="-2.54" length="short" rot="R180"/>
</symbol>
<symbol name="Q">
<wire x1="1.016" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.016" y1="1.778" x2="1.016" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="-1.778" width="0.254" layer="94"/>
<text x="2.54" y="1.016" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.159" y="-1.143" size="0.8636" layer="93">1</text>
<text x="1.524" y="-1.143" size="0.8636" layer="93">2</text>
<pin name="2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="STM32L031F*P" prefix="IC">
<description>&lt;b&gt;ARM 32-bit Cortex™-M0+ CPU&lt;/b&gt;&lt;p&gt;
32 MHz maximum frequency&lt;br&gt;
16 Kbytes of Flash memory&lt;br&gt;
8 kbytes of SRAM&lt;br&gt;
15 GPIOs&lt;br&gt;
1.65 to 3.6 V application supply&lt;br&gt;</description>
<gates>
<gate name="MCU" symbol="STM32_20PIN_TYP1" x="0" y="0"/>
<gate name="PWR" symbol="PWR_VDD1_VSS1" x="45.72" y="0" addlevel="request"/>
</gates>
<devices>
<device name="" package="TSSOP20-I">
<connects>
<connect gate="MCU" pin="BOOT0" pad="1"/>
<connect gate="MCU" pin="NRST" pad="4"/>
<connect gate="MCU" pin="OSC32_IN" pad="2"/>
<connect gate="MCU" pin="OSC32_OUT" pad="3"/>
<connect gate="MCU" pin="PA0-WKUP" pad="6"/>
<connect gate="MCU" pin="PA1" pad="7"/>
<connect gate="MCU" pin="PA10" pad="18"/>
<connect gate="MCU" pin="PA13" pad="19"/>
<connect gate="MCU" pin="PA14" pad="20"/>
<connect gate="MCU" pin="PA2" pad="8"/>
<connect gate="MCU" pin="PA3" pad="9"/>
<connect gate="MCU" pin="PA4" pad="10"/>
<connect gate="MCU" pin="PA5" pad="11"/>
<connect gate="MCU" pin="PA6" pad="12"/>
<connect gate="MCU" pin="PA7" pad="13"/>
<connect gate="MCU" pin="PA9" pad="17"/>
<connect gate="MCU" pin="PB1" pad="14"/>
<connect gate="MCU" pin="VDDA" pad="5"/>
<connect gate="PWR" pin="VDD@1" pad="16"/>
<connect gate="PWR" pin="VSS@1" pad="15"/>
</connects>
<technologies>
<technology name="4"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CR2032H" prefix="G">
<description>&lt;b&gt;LI BATTERY&lt;/b&gt; Varta</description>
<gates>
<gate name="1" symbol="1V2+2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CR2032H">
<connects>
<connect gate="1" pin="+" pad="+"/>
<connect gate="1" pin="+@1" pad="+@1"/>
<connect gate="1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MCP9700" prefix="IC">
<description>&lt;b&gt;SOT-23 Low-Power Linear Active Thermistor&lt;/b&gt;&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="MCP9700" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="VDD" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GD25">
<gates>
<gate name="G$1" symbol="GD25D10B" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="TSSOP8">
<connects>
<connect gate="G$1" pin="CS" pad="1"/>
<connect gate="G$1" pin="SCLK" pad="6"/>
<connect gate="G$1" pin="SI" pad="5"/>
<connect gate="G$1" pin="SO" pad="2"/>
<connect gate="G$1" pin="VCC" pad="8"/>
<connect gate="G$1" pin="VSS" pad="4"/>
<connect gate="G$1" pin="WP" pad="3"/>
</connects>
<technologies>
<technology name=""/>
<technology name="D"/>
</technologies>
</device>
<device name="SO08" package="SO08">
<connects>
<connect gate="G$1" pin="CS" pad="1"/>
<connect gate="G$1" pin="SCLK" pad="6"/>
<connect gate="G$1" pin="SI" pad="5"/>
<connect gate="G$1" pin="SO" pad="2"/>
<connect gate="G$1" pin="VCC" pad="8"/>
<connect gate="G$1" pin="VSS" pad="4"/>
<connect gate="G$1" pin="WP" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CRYSTAL" prefix="Q" uservalue="yes">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="Q" x="0" y="0"/>
</gates>
<devices>
<device name="HC49S" package="HC49/S">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="1667008" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49GW" package="HC49GW">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49TL-H" package="HC49TL-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49U-H" package="HC49U-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="1666973" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49U-LM" package="HC49U-LM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="1666956" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49U-V" package="HC49U-V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="1666969" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49U70" package="HC49U70">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC49UP" package="HC49UP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC13U-H" package="HC13U-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC18U-H" package="HC18U-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC18U-V" package="HC18U-V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC33U-H" package="HC33U-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HC33U-V" package="HC33U-V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="SM49" package="SM49">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="TC26H" package="TC26H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="TC26V" package="TC26V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="TC38H" package="TC38H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="68SMX" package="86SMX">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="6344860" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="MM20SS" package="MM20SS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="MM39SL" package="MM39SL">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="CTS406" package="CTS406">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="TC38H-SMD" package="TC38H-SMD">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="rcl">
<description>&lt;b&gt;Resistors, Capacitors, Inductors&lt;/b&gt;&lt;p&gt;
Based on the previous libraries:
&lt;ul&gt;
&lt;li&gt;r.lbr
&lt;li&gt;cap.lbr 
&lt;li&gt;cap-fe.lbr
&lt;li&gt;captant.lbr
&lt;li&gt;polcap.lbr
&lt;li&gt;ipc-smd.lbr
&lt;/ul&gt;
All SMD packages are defined according to the IPC specifications and  CECC&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;p&gt;
&lt;p&gt;
for Electrolyt Capacitors see also :&lt;p&gt;
www.bccomponents.com &lt;p&gt;
www.panasonic.com&lt;p&gt;
www.kemet.com&lt;p&gt;
http://www.secc.co.jp/pdf/os_e/2004/e_os_all.pdf &lt;b&gt;(SANYO)&lt;/b&gt;
&lt;p&gt;
for trimmer refence see : &lt;u&gt;www.electrospec-inc.com/cross_references/trimpotcrossref.asp&lt;/u&gt;&lt;p&gt;

&lt;table border=0 cellspacing=0 cellpadding=0 width="100%" cellpaddding=0&gt;
&lt;tr valign="top"&gt;

&lt;! &lt;td width="10"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td width="90%"&gt;

&lt;b&gt;&lt;font color="#0000FF" size="4"&gt;TRIM-POT CROSS REFERENCE&lt;/font&gt;&lt;/b&gt;
&lt;P&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;RECTANGULAR MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;BOURNS&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;BI&amp;nbsp;TECH&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;DALE-VISHAY&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;PHILIPS/MEPCO&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;MURATA&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;PANASONIC&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;SPECTROL&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;MILSPEC&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;&lt;TD&gt;&amp;nbsp;&lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3 &gt;
      3005P&lt;BR&gt;
      3006P&lt;BR&gt;
      3006W&lt;BR&gt;
      3006Y&lt;BR&gt;
      3009P&lt;BR&gt;
      3009W&lt;BR&gt;
      3009Y&lt;BR&gt;
      3057J&lt;BR&gt;
      3057L&lt;BR&gt;
      3057P&lt;BR&gt;
      3057Y&lt;BR&gt;
      3059J&lt;BR&gt;
      3059L&lt;BR&gt;
      3059P&lt;BR&gt;
      3059Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      89P&lt;BR&gt;
      89W&lt;BR&gt;
      89X&lt;BR&gt;
      89PH&lt;BR&gt;
      76P&lt;BR&gt;
      89XH&lt;BR&gt;
      78SLT&lt;BR&gt;
      78L&amp;nbsp;ALT&lt;BR&gt;
      56P&amp;nbsp;ALT&lt;BR&gt;
      78P&amp;nbsp;ALT&lt;BR&gt;
      T8S&lt;BR&gt;
      78L&lt;BR&gt;
      56P&lt;BR&gt;
      78P&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      T18/784&lt;BR&gt;
      783&lt;BR&gt;
      781&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      2199&lt;BR&gt;
      1697/1897&lt;BR&gt;
      1680/1880&lt;BR&gt;
      2187&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      8035EKP/CT20/RJ-20P&lt;BR&gt;
      -&lt;BR&gt;
      RJ-20X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      1211L&lt;BR&gt;
      8012EKQ&amp;nbsp;ALT&lt;BR&gt;
      8012EKR&amp;nbsp;ALT&lt;BR&gt;
      1211P&lt;BR&gt;
      8012EKJ&lt;BR&gt;
      8012EKL&lt;BR&gt;
      8012EKQ&lt;BR&gt;
      8012EKR&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      2101P&lt;BR&gt;
      2101W&lt;BR&gt;
      2101Y&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      2102L&lt;BR&gt;
      2102S&lt;BR&gt;
      2102Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      EVMCOG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      43P&lt;BR&gt;
      43W&lt;BR&gt;
      43Y&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      40L&lt;BR&gt;
      40P&lt;BR&gt;
      40Y&lt;BR&gt;
      70Y-T602&lt;BR&gt;
      70L&lt;BR&gt;
      70P&lt;BR&gt;
      70Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      -&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SQUARE MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
   &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MURATA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;SPECTROL&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MILSPEC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3250L&lt;BR&gt;
      3250P&lt;BR&gt;
      3250W&lt;BR&gt;
      3250X&lt;BR&gt;
      3252P&lt;BR&gt;
      3252W&lt;BR&gt;
      3252X&lt;BR&gt;
      3260P&lt;BR&gt;
      3260W&lt;BR&gt;
      3260X&lt;BR&gt;
      3262P&lt;BR&gt;
      3262W&lt;BR&gt;
      3262X&lt;BR&gt;
      3266P&lt;BR&gt;
      3266W&lt;BR&gt;
      3266X&lt;BR&gt;
      3290H&lt;BR&gt;
      3290P&lt;BR&gt;
      3290W&lt;BR&gt;
      3292P&lt;BR&gt;
      3292W&lt;BR&gt;
      3292X&lt;BR&gt;
      3296P&lt;BR&gt;
      3296W&lt;BR&gt;
      3296X&lt;BR&gt;
      3296Y&lt;BR&gt;
      3296Z&lt;BR&gt;
      3299P&lt;BR&gt;
      3299W&lt;BR&gt;
      3299X&lt;BR&gt;
      3299Y&lt;BR&gt;
      3299Z&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      -&lt;BR&gt;
      64W&amp;nbsp;ALT&lt;BR&gt;
      -&lt;BR&gt;
      64P&amp;nbsp;ALT&lt;BR&gt;
      64W&amp;nbsp;ALT&lt;BR&gt;
      64X&amp;nbsp;ALT&lt;BR&gt;
      64P&lt;BR&gt;
      64W&lt;BR&gt;
      64X&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66P&lt;BR&gt;
      66W&lt;BR&gt;
      66X&lt;BR&gt;
      67P&lt;BR&gt;
      67W&lt;BR&gt;
      67X&lt;BR&gt;
      67Y&lt;BR&gt;
      67Z&lt;BR&gt;
      68P&lt;BR&gt;
      68W&lt;BR&gt;
      68X&lt;BR&gt;
      67Y&amp;nbsp;ALT&lt;BR&gt;
      67Z&amp;nbsp;ALT&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      5050&lt;BR&gt;
      5091&lt;BR&gt;
      5080&lt;BR&gt;
      5087&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T63YB&lt;BR&gt;
      T63XB&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      5887&lt;BR&gt;
      5891&lt;BR&gt;
      5880&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T93Z&lt;BR&gt;
      T93YA&lt;BR&gt;
      T93XA&lt;BR&gt;
      T93YB&lt;BR&gt;
      T93XB&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8026EKP&lt;BR&gt;
      8026EKW&lt;BR&gt;
      8026EKM&lt;BR&gt;
      8026EKP&lt;BR&gt;
      8026EKB&lt;BR&gt;
      8026EKM&lt;BR&gt;
      1309X&lt;BR&gt;
      1309P&lt;BR&gt;
      1309W&lt;BR&gt;
      8024EKP&lt;BR&gt;
      8024EKW&lt;BR&gt;
      8024EKN&lt;BR&gt;
      RJ-9P/CT9P&lt;BR&gt;
      RJ-9W&lt;BR&gt;
      RJ-9X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3103P&lt;BR&gt;
      3103Y&lt;BR&gt;
      3103Z&lt;BR&gt;
      3103P&lt;BR&gt;
      3103Y&lt;BR&gt;
      3103Z&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3105P/3106P&lt;BR&gt;
      3105W/3106W&lt;BR&gt;
      3105X/3106X&lt;BR&gt;
      3105Y/3106Y&lt;BR&gt;
      3105Z/3105Z&lt;BR&gt;
      3102P&lt;BR&gt;
      3102W&lt;BR&gt;
      3102X&lt;BR&gt;
      3102Y&lt;BR&gt;
      3102Z&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMCBG&lt;BR&gt;
      EVMCCG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      55-1-X&lt;BR&gt;
      55-4-X&lt;BR&gt;
      55-3-X&lt;BR&gt;
      55-2-X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      50-2-X&lt;BR&gt;
      50-4-X&lt;BR&gt;
      50-3-X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      64P&lt;BR&gt;
      64W&lt;BR&gt;
      64X&lt;BR&gt;
      64Y&lt;BR&gt;
      64Z&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SINGLE TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MURATA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;SPECTROL&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MILSPEC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3323P&lt;BR&gt;
      3323S&lt;BR&gt;
      3323W&lt;BR&gt;
      3329H&lt;BR&gt;
      3329P&lt;BR&gt;
      3329W&lt;BR&gt;
      3339H&lt;BR&gt;
      3339P&lt;BR&gt;
      3339W&lt;BR&gt;
      3352E&lt;BR&gt;
      3352H&lt;BR&gt;
      3352K&lt;BR&gt;
      3352P&lt;BR&gt;
      3352T&lt;BR&gt;
      3352V&lt;BR&gt;
      3352W&lt;BR&gt;
      3362H&lt;BR&gt;
      3362M&lt;BR&gt;
      3362P&lt;BR&gt;
      3362R&lt;BR&gt;
      3362S&lt;BR&gt;
      3362U&lt;BR&gt;
      3362W&lt;BR&gt;
      3362X&lt;BR&gt;
      3386B&lt;BR&gt;
      3386C&lt;BR&gt;
      3386F&lt;BR&gt;
      3386H&lt;BR&gt;
      3386K&lt;BR&gt;
      3386M&lt;BR&gt;
      3386P&lt;BR&gt;
      3386S&lt;BR&gt;
      3386W&lt;BR&gt;
      3386X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      25P&lt;BR&gt;
      25S&lt;BR&gt;
      25RX&lt;BR&gt;
      82P&lt;BR&gt;
      82M&lt;BR&gt;
      82PA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      91E&lt;BR&gt;
      91X&lt;BR&gt;
      91T&lt;BR&gt;
      91B&lt;BR&gt;
      91A&lt;BR&gt;
      91V&lt;BR&gt;
      91W&lt;BR&gt;
      25W&lt;BR&gt;
      25V&lt;BR&gt;
      25P&lt;BR&gt;
      -&lt;BR&gt;
      25S&lt;BR&gt;
      25U&lt;BR&gt;
      25RX&lt;BR&gt;
      25X&lt;BR&gt;
      72XW&lt;BR&gt;
      72XL&lt;BR&gt;
      72PM&lt;BR&gt;
      72RX&lt;BR&gt;
      -&lt;BR&gt;
      72PX&lt;BR&gt;
      72P&lt;BR&gt;
      72RXW&lt;BR&gt;
      72RXL&lt;BR&gt;
      72X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T7YB&lt;BR&gt;
      T7YA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      TXD&lt;BR&gt;
      TYA&lt;BR&gt;
      TYP&lt;BR&gt;
      -&lt;BR&gt;
      TYD&lt;BR&gt;
      TX&lt;BR&gt;
      -&lt;BR&gt;
      150SX&lt;BR&gt;
      100SX&lt;BR&gt;
      102T&lt;BR&gt;
      101S&lt;BR&gt;
      190T&lt;BR&gt;
      150TX&lt;BR&gt;
      101&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      101SX&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ET6P&lt;BR&gt;
      ET6S&lt;BR&gt;
      ET6X&lt;BR&gt;
      RJ-6W/8014EMW&lt;BR&gt;
      RJ-6P/8014EMP&lt;BR&gt;
      RJ-6X/8014EMX&lt;BR&gt;
      TM7W&lt;BR&gt;
      TM7P&lt;BR&gt;
      TM7X&lt;BR&gt;
      -&lt;BR&gt;
      8017SMS&lt;BR&gt;
      -&lt;BR&gt;
      8017SMB&lt;BR&gt;
      8017SMA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      CT-6W&lt;BR&gt;
      CT-6H&lt;BR&gt;
      CT-6P&lt;BR&gt;
      CT-6R&lt;BR&gt;
      -&lt;BR&gt;
      CT-6V&lt;BR&gt;
      CT-6X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8038EKV&lt;BR&gt;
      -&lt;BR&gt;
      8038EKX&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8038EKP&lt;BR&gt;
      8038EKZ&lt;BR&gt;
      8038EKW&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3321H&lt;BR&gt;
      3321P&lt;BR&gt;
      3321N&lt;BR&gt;
      1102H&lt;BR&gt;
      1102P&lt;BR&gt;
      1102T&lt;BR&gt;
      RVA0911V304A&lt;BR&gt;
      -&lt;BR&gt;
      RVA0911H413A&lt;BR&gt;
      RVG0707V100A&lt;BR&gt;
      RVA0607V(H)306A&lt;BR&gt;
      RVA1214H213A&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3104B&lt;BR&gt;
      3104C&lt;BR&gt;
      3104F&lt;BR&gt;
      3104H&lt;BR&gt;
      -&lt;BR&gt;
      3104M&lt;BR&gt;
      3104P&lt;BR&gt;
      3104S&lt;BR&gt;
      3104W&lt;BR&gt;
      3104X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      EVMQ0G&lt;BR&gt;
      EVMQIG&lt;BR&gt;
      EVMQ3G&lt;BR&gt;
      EVMS0G&lt;BR&gt;
      EVMQ0G&lt;BR&gt;
      EVMG0G&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMK4GA00B&lt;BR&gt;
      EVM30GA00B&lt;BR&gt;
      EVMK0GA00B&lt;BR&gt;
      EVM38GA00B&lt;BR&gt;
      EVMB6&lt;BR&gt;
      EVLQ0&lt;BR&gt;
      -&lt;BR&gt;
      EVMMSG&lt;BR&gt;
      EVMMBG&lt;BR&gt;
      EVMMAG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMMCS&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM1&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM0&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM3&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      62-3-1&lt;BR&gt;
      62-1-2&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      67R&lt;BR&gt;
      -&lt;BR&gt;
      67P&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      67X&lt;BR&gt;
      63V&lt;BR&gt;
      63S&lt;BR&gt;
      63M&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      63H&lt;BR&gt;
      63P&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      63X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
&lt;/TABLE&gt;
&lt;P&gt;&amp;nbsp;&lt;P&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=3&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;
      &lt;FONT color="#0000FF" SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SMD TRIM-POT CROSS REFERENCE&lt;/B&gt;&lt;/FONT&gt;
      &lt;P&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURNS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;TOCOS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;AUX/KYOCERA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3224G&lt;BR&gt;
      3224J&lt;BR&gt;
      3224W&lt;BR&gt;
      3269P&lt;BR&gt;
      3269W&lt;BR&gt;
      3269X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      44G&lt;BR&gt;
      44J&lt;BR&gt;
      44W&lt;BR&gt;
      84P&lt;BR&gt;
      84W&lt;BR&gt;
      84X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST63Z&lt;BR&gt;
      ST63Y&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST5P&lt;BR&gt;
      ST5W&lt;BR&gt;
      ST5X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SINGLE TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURNS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;TOCOS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;AUX/KYOCERA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3314G&lt;BR&gt;
      3314J&lt;BR&gt;
      3364A/B&lt;BR&gt;
      3364C/D&lt;BR&gt;
      3364W/X&lt;BR&gt;
      3313G&lt;BR&gt;
      3313J&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      23B&lt;BR&gt;
      23A&lt;BR&gt;
      21X&lt;BR&gt;
      21W&lt;BR&gt;
      -&lt;BR&gt;
      22B&lt;BR&gt;
      22A&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ST5YL/ST53YL&lt;BR&gt;
      ST5YJ/5T53YJ&lt;BR&gt;
      ST-23A&lt;BR&gt;
      ST-22B&lt;BR&gt;
      ST-22&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ST-4B&lt;BR&gt;
      ST-4A&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST-3B&lt;BR&gt;
      ST-3A&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      EVM-6YS&lt;BR&gt;
      EVM-1E&lt;BR&gt;
      EVM-1G&lt;BR&gt;
      EVM-1D&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      G4B&lt;BR&gt;
      G4A&lt;BR&gt;
      TR04-3S1&lt;BR&gt;
      TRG04-2S1&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      DVR-43A&lt;BR&gt;
      CVR-42C&lt;BR&gt;
      CVR-42A/C&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
&lt;/TABLE&gt;
&lt;P&gt;
&lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;ALT =&amp;nbsp;ALTERNATE&lt;/B&gt;&lt;/FONT&gt;
&lt;P&gt;

&amp;nbsp;
&lt;P&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;</description>
<packages>
<package name="R0402">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="R0603">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.356" x2="0.432" y2="-0.356" width="0.1524" layer="51"/>
<wire x1="0.432" y1="0.356" x2="-0.432" y2="0.356" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1" dy="1.1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1" dy="1.1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4318" x2="0.8382" y2="0.4318" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4318" x2="-0.4318" y2="0.4318" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="R0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R0805W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; wave soldering&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.0525" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="1.0525" y="0" dx="1.5" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R1005">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="R1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1524" layer="51"/>
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="2" x="1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="1" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51"/>
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R1206W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R1210">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8999" x2="0.3" y2="0.8999" layer="35"/>
</package>
<package name="R1210W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="R2010">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="R2010W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.311" y="0" dx="2" dy="1.8" layer="1"/>
<smd name="2" x="2.311" y="0" dx="2" dy="1.8" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="R2012">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1001" y1="-0.5999" x2="0.1001" y2="0.5999" layer="35"/>
</package>
<package name="R2012W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.94" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="0.94" y="0" dx="1.5" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1001" y1="-0.5999" x2="0.1001" y2="0.5999" layer="35"/>
</package>
<package name="R2512">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R2512W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.896" y="0" dx="2" dy="2.1" layer="1"/>
<smd name="2" x="2.896" y="0" dx="2" dy="2.1" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R3216">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R3216W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R3225">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="R3225W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="R5025">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R5025W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.311" y="0" dx="2" dy="1.8" layer="1"/>
<smd name="2" x="2.311" y="0" dx="2" dy="1.8" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R6332">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
Source: http://download.siliconexpert.com/pdfs/2005/02/24/Semi_Ap/2/VSH/Resistor/dcrcwfre.pdf</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-3.1" y="0" dx="1" dy="3.2" layer="1"/>
<smd name="2" x="3.1" y="0" dx="1" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R6332W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; wave soldering&lt;p&gt;
Source: http://download.siliconexpert.com/pdfs/2005/02/24/Semi_Ap/2/VSH/Resistor/dcrcwfre.pdf</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-3.196" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.196" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="M0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.10 W</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="0.7112" y1="0.635" x2="-0.7112" y2="0.635" width="0.1524" layer="51"/>
<wire x1="0.7112" y1="-0.635" x2="-0.7112" y2="-0.635" width="0.1524" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0414" y1="-0.7112" x2="-0.6858" y2="0.7112" layer="51"/>
<rectangle x1="0.6858" y1="-0.7112" x2="1.0414" y2="0.7112" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5999" x2="0.1999" y2="0.5999" layer="35"/>
</package>
<package name="M1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.143" y1="0.8382" x2="-1.143" y2="0.8382" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.8382" x2="-1.143" y2="-0.8382" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.9144" x2="-1.1176" y2="0.9144" layer="51"/>
<rectangle x1="1.1176" y1="-0.9144" x2="1.7018" y2="0.9144" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="M1406">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.12 W</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.3208" y1="0.762" x2="-1.3208" y2="0.762" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.762" x2="-1.3208" y2="-0.762" width="0.1524" layer="51"/>
<smd name="1" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="2" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8382" x2="-1.2954" y2="0.8382" layer="51"/>
<rectangle x1="1.2954" y1="-0.8382" x2="1.8542" y2="0.8382" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="M2012">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.10 W</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="0.7112" y1="0.635" x2="-0.7112" y2="0.635" width="0.1524" layer="51"/>
<wire x1="0.7112" y1="-0.635" x2="-0.7112" y2="-0.635" width="0.1524" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0414" y1="-0.7112" x2="-0.6858" y2="0.7112" layer="51"/>
<rectangle x1="0.6858" y1="-0.7112" x2="1.0414" y2="0.7112" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5999" x2="0.1999" y2="0.5999" layer="35"/>
</package>
<package name="M2309">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-4.473" y1="1.483" x2="4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="-1.483" x2="-4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-4.473" y1="-1.483" x2="-4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="1.483" x2="4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.413" y1="1.1684" x2="-2.4384" y2="1.1684" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.1684" x2="-2.413" y2="-1.1684" width="0.1524" layer="51"/>
<smd name="1" x="-2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<smd name="2" x="2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.048" y1="-1.2446" x2="-2.3876" y2="1.2446" layer="51"/>
<rectangle x1="2.3876" y1="-1.2446" x2="3.048" y2="1.2446" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="M3216">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.143" y1="0.8382" x2="-1.143" y2="0.8382" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.8382" x2="-1.143" y2="-0.8382" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.9144" x2="-1.1176" y2="0.9144" layer="51"/>
<rectangle x1="1.1176" y1="-0.9144" x2="1.7018" y2="0.9144" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="M3516">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.12 W</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.3208" y1="0.762" x2="-1.3208" y2="0.762" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.762" x2="-1.3208" y2="-0.762" width="0.1524" layer="51"/>
<smd name="1" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="2" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8382" x2="-1.2954" y2="0.8382" layer="51"/>
<rectangle x1="1.2954" y1="-0.8382" x2="1.8542" y2="0.8382" layer="51"/>
<rectangle x1="-0.4001" y1="-0.7" x2="0.4001" y2="0.7" layer="35"/>
</package>
<package name="M5923">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-4.473" y1="1.483" x2="4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="-1.483" x2="-4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-4.473" y1="-1.483" x2="-4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="1.483" x2="4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.413" y1="1.1684" x2="-2.4384" y2="1.1684" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.1684" x2="-2.413" y2="-1.1684" width="0.1524" layer="51"/>
<smd name="1" x="-2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<smd name="2" x="2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.048" y1="-1.2446" x2="-2.3876" y2="1.2446" layer="51"/>
<rectangle x1="2.3876" y1="-1.2446" x2="3.048" y2="1.2446" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="0204/5">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0" x2="-2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-1.778" y1="0.635" x2="-1.524" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.524" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="-0.889" x2="1.778" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="0.889" x2="1.778" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.778" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-1.524" y1="0.889" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0.762" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.889" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.762" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="-1.143" y2="0.762" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="-1.143" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.889" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.889" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.635" x2="1.778" y2="0.635" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.0066" y="1.1684" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-0.254" x2="-1.778" y2="0.254" layer="51"/>
<rectangle x1="1.778" y1="-0.254" x2="2.032" y2="0.254" layer="51"/>
</package>
<package name="0204/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 7.5 mm</description>
<wire x1="3.81" y1="0" x2="2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0.762" x2="-2.286" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.286" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="-0.762" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.016" x2="2.54" y2="0.762" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.016" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="0.889" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.016" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-0.889" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="-1.778" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="-1.778" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.016" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.016" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="2.54" y2="0.762" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.2954" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.6256" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.54" y1="-0.254" x2="2.921" y2="0.254" layer="21"/>
<rectangle x1="-2.921" y1="-0.254" x2="-2.54" y2="0.254" layer="21"/>
</package>
<package name="0204V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.508" layer="51"/>
<wire x1="-0.127" y1="0" x2="0.127" y2="0" width="0.508" layer="21"/>
<circle x="-1.27" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="0" radius="0.635" width="0.0508" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.1336" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 10 mm</description>
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.048" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="0207/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 12 mm</description>
<wire x1="6.35" y1="0" x2="5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="4.445" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-4.445" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.3086" y2="0.3048" layer="21"/>
<rectangle x1="-5.3086" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
</package>
<package name="0207/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 15mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.715" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-5.715" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="5.715" y1="-0.3048" x2="6.5786" y2="0.3048" layer="21"/>
<rectangle x1="-6.5786" y1="-0.3048" x2="-5.715" y2="0.3048" layer="21"/>
</package>
<package name="0207/2V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="-0.381" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.254" y1="0" x2="0.254" y2="0" width="0.6096" layer="21"/>
<wire x1="0.381" y1="0" x2="1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.27" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-0.0508" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0508" y="-2.2352" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/5V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-0.889" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.762" y1="0" x2="0.762" y2="0" width="0.6096" layer="21"/>
<wire x1="0.889" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<circle x="-2.54" y="0" radius="1.27" width="0.1016" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.143" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.143" y="-2.159" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 7.5 mm</description>
<wire x1="-3.81" y1="0" x2="-3.429" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0" x2="3.81" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.5588" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.429" y1="-0.3048" x2="-3.175" y2="0.3048" layer="51"/>
<rectangle x1="3.175" y1="-0.3048" x2="3.429" y2="0.3048" layer="51"/>
</package>
<package name="0309/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 10mm</description>
<wire x1="-4.699" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="5.08" y1="0" x2="4.699" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.6228" y1="-0.3048" x2="-4.318" y2="0.3048" layer="51"/>
<rectangle x1="4.318" y1="-0.3048" x2="4.6228" y2="0.3048" layer="51"/>
</package>
<package name="0309/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.318" y1="-0.3048" x2="5.1816" y2="0.3048" layer="21"/>
<rectangle x1="-5.1816" y1="-0.3048" x2="-4.318" y2="0.3048" layer="21"/>
</package>
<package name="0309V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 2.5 mm</description>
<wire x1="1.27" y1="0" x2="0.635" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.524" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="0.762" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="0.254" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.254" y="-2.2098" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.254" y1="-0.3048" x2="0.5588" y2="0.3048" layer="51"/>
<rectangle x1="-0.635" y1="-0.3048" x2="-0.3302" y2="0.3048" layer="51"/>
<rectangle x1="-0.3302" y1="-0.3048" x2="0.254" y2="0.3048" layer="21"/>
</package>
<package name="0411/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.461" y2="0" width="0.762" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.461" y2="0" width="0.762" layer="51"/>
<wire x1="5.08" y1="-1.651" x2="5.08" y2="1.651" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.032" x2="5.08" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.651" x2="-4.699" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="4.699" y1="-2.032" x2="5.08" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.651" x2="-4.699" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="2.032" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="1.905" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.032" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.905" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="3.937" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="3.937" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.651" x2="-5.08" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="2.032" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-2.032" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.5814" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.3594" y1="-0.381" x2="-5.08" y2="0.381" layer="21"/>
<rectangle x1="5.08" y1="-0.381" x2="5.3594" y2="0.381" layer="21"/>
</package>
<package name="0411/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 15 mm</description>
<wire x1="5.08" y1="-1.651" x2="5.08" y2="1.651" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.032" x2="5.08" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.651" x2="-4.699" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="4.699" y1="-2.032" x2="5.08" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.651" x2="-4.699" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="2.032" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="1.905" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.032" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.905" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="3.937" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="3.937" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.651" x2="-5.08" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="2.032" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-2.032" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0" x2="-6.35" y2="0" width="0.762" layer="51"/>
<wire x1="6.35" y1="0" x2="7.62" y2="0" width="0.762" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.5814" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="5.08" y1="-0.381" x2="6.477" y2="0.381" layer="21"/>
<rectangle x1="-6.477" y1="-0.381" x2="-5.08" y2="0.381" layer="21"/>
</package>
<package name="0411V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 3.81 mm</description>
<wire x1="1.27" y1="0" x2="0.3048" y2="0" width="0.762" layer="51"/>
<wire x1="-1.5748" y1="0" x2="-2.54" y2="0" width="0.762" layer="51"/>
<circle x="-2.54" y="0" radius="2.032" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.9144" shape="octagon"/>
<text x="-0.508" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.5334" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.4732" y1="-0.381" x2="0.2032" y2="0.381" layer="21"/>
</package>
<package name="0414/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0414, grid 15 mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.096" y1="1.905" x2="-5.842" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.096" y1="-1.905" x2="-5.842" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="5.842" y1="-2.159" x2="6.096" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<wire x1="5.842" y1="2.159" x2="6.096" y2="1.905" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.096" y1="-1.905" x2="-6.096" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="2.159" x2="-4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.032" x2="-4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-2.159" x2="-4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.032" x2="-4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="-4.826" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.032" x2="4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.032" x2="-4.826" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="5.842" y1="2.159" x2="4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-2.159" x2="4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-1.905" x2="6.096" y2="1.905" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.096" y="2.5654" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="6.096" y1="-0.4064" x2="6.5024" y2="0.4064" layer="21"/>
<rectangle x1="-6.5024" y1="-0.4064" x2="-6.096" y2="0.4064" layer="21"/>
</package>
<package name="0414V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0414, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="2.159" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.381" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.381" y="-2.3622" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2954" y1="-0.4064" x2="1.2954" y2="0.4064" layer="21"/>
</package>
<package name="0617/17">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 17.5 mm</description>
<wire x1="-8.89" y1="0" x2="-8.636" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.874" y1="3.048" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="2.794" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.048" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-2.794" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="-6.731" y2="2.794" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="-6.731" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="7.874" y1="3.048" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-3.048" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.667" x2="-8.255" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.016" x2="-8.255" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-8.255" y1="1.016" x2="-8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.667" x2="8.255" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.016" x2="8.255" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="8.255" y1="1.016" x2="8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="8.636" y1="0" x2="8.89" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="2.667" x2="-7.874" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="7.874" y1="3.048" x2="8.255" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.255" y1="-2.667" x2="-7.874" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="7.874" y1="-3.048" x2="8.255" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="8.89" y="0" drill="1.016" shape="octagon"/>
<text x="-8.128" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.096" y="-0.7112" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-8.5344" y1="-0.4064" x2="-8.2296" y2="0.4064" layer="51"/>
<rectangle x1="8.2296" y1="-0.4064" x2="8.5344" y2="0.4064" layer="51"/>
</package>
<package name="0617/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 22.5 mm</description>
<wire x1="-10.287" y1="0" x2="-11.43" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="-2.667" x2="-8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="3.048" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="2.794" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.048" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-2.794" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="-6.731" y2="2.794" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="-6.731" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="7.874" y1="3.048" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-3.048" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.667" x2="8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0" x2="10.287" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="2.667" x2="-7.874" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.255" y1="-2.667" x2="-7.874" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="7.874" y1="3.048" x2="8.255" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="7.874" y1="-3.048" x2="8.255" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-8.255" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.477" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.1854" y1="-0.4064" x2="-8.255" y2="0.4064" layer="21"/>
<rectangle x1="8.255" y1="-0.4064" x2="10.1854" y2="0.4064" layer="21"/>
</package>
<package name="0617V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.8128" layer="51"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="3.048" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="0.635" y="1.4224" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.635" y="-2.6162" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.3208" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="0922/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0922, grid 22.5 mm</description>
<wire x1="11.43" y1="0" x2="10.795" y2="0" width="0.8128" layer="51"/>
<wire x1="-11.43" y1="0" x2="-10.795" y2="0" width="0.8128" layer="51"/>
<wire x1="-10.16" y1="-4.191" x2="-10.16" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="4.572" x2="-8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="4.318" x2="-8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="-4.572" x2="-8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="-4.318" x2="-8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="4.318" x2="8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="4.318" x2="-8.636" y2="4.318" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-4.318" x2="8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-4.318" x2="-8.636" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="9.779" y1="4.572" x2="8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-4.572" x2="8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-4.191" x2="10.16" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-4.191" x2="-9.779" y2="-4.572" width="0.1524" layer="21" curve="90"/>
<wire x1="-10.16" y1="4.191" x2="-9.779" y2="4.572" width="0.1524" layer="21" curve="-90"/>
<wire x1="9.779" y1="-4.572" x2="10.16" y2="-4.191" width="0.1524" layer="21" curve="90"/>
<wire x1="9.779" y1="4.572" x2="10.16" y2="4.191" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-10.16" y="5.1054" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.477" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.7188" y1="-0.4064" x2="-10.16" y2="0.4064" layer="51"/>
<rectangle x1="10.16" y1="-0.4064" x2="10.3124" y2="0.4064" layer="21"/>
<rectangle x1="-10.3124" y1="-0.4064" x2="-10.16" y2="0.4064" layer="21"/>
<rectangle x1="10.16" y1="-0.4064" x2="10.7188" y2="0.4064" layer="51"/>
</package>
<package name="P0613V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0613, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="2.286" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.254" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.254" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2954" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="P0613/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0613, grid 15 mm</description>
<wire x1="7.62" y1="0" x2="6.985" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.985" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.477" y1="2.032" x2="-6.223" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.477" y1="-2.032" x2="-6.223" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="6.223" y1="-2.286" x2="6.477" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="6.223" y1="2.286" x2="6.477" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.223" y1="2.286" x2="-5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.159" x2="-5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-6.223" y1="-2.286" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="-2.159" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="2.159" x2="5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="2.159" x2="-5.207" y2="2.159" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.159" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.159" x2="-5.207" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="6.223" y1="2.286" x2="5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="6.223" y1="-2.286" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-0.635" x2="6.477" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-0.635" x2="6.477" y2="0.635" width="0.1524" layer="51"/>
<wire x1="6.477" y1="2.032" x2="6.477" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.032" x2="-6.477" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="0.635" x2="-6.477" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="0.635" x2="-6.477" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.477" y="2.6924" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.7112" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-7.0358" y1="-0.4064" x2="-6.477" y2="0.4064" layer="51"/>
<rectangle x1="6.477" y1="-0.4064" x2="7.0358" y2="0.4064" layer="51"/>
</package>
<package name="P0817/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0817, grid 22.5 mm</description>
<wire x1="-10.414" y1="0" x2="-11.43" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.509" y1="-3.429" x2="-8.509" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="3.81" x2="-7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="3.556" x2="-7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-3.81" x2="-7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-3.556" x2="-7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="3.556" x2="7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="3.556" x2="-6.985" y2="3.556" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.556" x2="7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.556" x2="-6.985" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="8.128" y1="3.81" x2="7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="8.128" y1="-3.81" x2="7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.429" x2="8.509" y2="3.429" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0" x2="10.414" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.509" y1="3.429" x2="-8.128" y2="3.81" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.509" y1="-3.429" x2="-8.128" y2="-3.81" width="0.1524" layer="21" curve="90"/>
<wire x1="8.128" y1="3.81" x2="8.509" y2="3.429" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.128" y1="-3.81" x2="8.509" y2="-3.429" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-8.382" y="4.2164" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.223" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="6.604" y="-2.2606" size="1.27" layer="51" ratio="10" rot="R90">0817</text>
<rectangle x1="8.509" y1="-0.4064" x2="10.3124" y2="0.4064" layer="21"/>
<rectangle x1="-10.3124" y1="-0.4064" x2="-8.509" y2="0.4064" layer="21"/>
</package>
<package name="P0817V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0817, grid 6.35 mm</description>
<wire x1="-3.81" y1="0" x2="-5.08" y2="0" width="0.8128" layer="51"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.8128" layer="51"/>
<circle x="-5.08" y="0" radius="3.81" width="0.1524" layer="21"/>
<circle x="-5.08" y="0" radius="1.27" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="octagon"/>
<text x="-1.016" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.016" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="2.032" size="1.016" layer="21" ratio="12">0817</text>
<rectangle x1="-3.81" y1="-0.4064" x2="0" y2="0.4064" layer="21"/>
</package>
<package name="V234/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V234, grid 12.5 mm</description>
<wire x1="-4.953" y1="1.524" x2="-4.699" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.778" x2="4.953" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-1.778" x2="4.953" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.953" y1="-1.524" x2="-4.699" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="1.778" x2="4.699" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="1.524" x2="-4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.778" x2="-4.699" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.953" y1="1.524" x2="4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0" x2="5.461" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.461" y2="0" width="0.8128" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.016" shape="octagon"/>
<text x="-4.953" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.953" y1="-0.4064" x2="5.4102" y2="0.4064" layer="21"/>
<rectangle x1="-5.4102" y1="-0.4064" x2="-4.953" y2="0.4064" layer="21"/>
</package>
<package name="V235/17">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V235, grid 17.78 mm</description>
<wire x1="-6.731" y1="2.921" x2="6.731" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="2.54" x2="-7.112" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.921" x2="-6.731" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="7.112" y1="2.54" x2="7.112" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="7.874" y2="0" width="1.016" layer="51"/>
<wire x1="-7.874" y1="0" x2="-8.89" y2="0" width="1.016" layer="51"/>
<wire x1="-7.112" y1="-2.54" x2="-6.731" y2="-2.921" width="0.1524" layer="21" curve="90"/>
<wire x1="6.731" y1="2.921" x2="7.112" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.731" y1="-2.921" x2="7.112" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-7.112" y1="2.54" x2="-6.731" y2="2.921" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-8.89" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="8.89" y="0" drill="1.1938" shape="octagon"/>
<text x="-6.858" y="3.302" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.842" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="7.112" y1="-0.508" x2="7.747" y2="0.508" layer="21"/>
<rectangle x1="-7.747" y1="-0.508" x2="-7.112" y2="0.508" layer="21"/>
</package>
<package name="V526-0">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V526-0, grid 2.5 mm</description>
<wire x1="-2.54" y1="1.016" x2="-2.286" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="1.27" x2="2.54" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="-1.27" x2="2.54" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.54" y1="-1.016" x2="-2.286" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.27" x2="-2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.016" x2="2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.27" x2="2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="-2.54" y2="-1.016" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.413" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.413" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0102R">
<description>&lt;b&gt;CECC Size RC2211&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1" y1="-0.5" x2="1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.5" x2="1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.2032" layer="51"/>
<smd name="1" x="-0.9" y="0" dx="0.5" dy="1.3" layer="1"/>
<smd name="2" x="0.9" y="0" dx="0.5" dy="1.3" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0102W">
<description>&lt;b&gt;CECC Size RC2211&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1" y1="-0.5" x2="1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.5" x2="1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.2032" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="0.6" dy="1.3" layer="1"/>
<smd name="2" x="0.95" y="0" dx="0.6" dy="1.3" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0204R">
<description>&lt;b&gt;CECC Size RC3715&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1.7" y1="-0.6" x2="1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="-0.6" x2="1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="0.6" x2="-1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="-1.7" y1="0.6" x2="-1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="0.938" y1="0.6" x2="-0.938" y2="0.6" width="0.2032" layer="21"/>
<wire x1="-0.938" y1="-0.6" x2="0.938" y2="-0.6" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="0.8" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="0.8" dy="1.6" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0204W">
<description>&lt;b&gt;CECC Size RC3715&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1.7" y1="-0.6" x2="1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="-0.6" x2="1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="0.6" x2="-1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="-1.7" y1="0.6" x2="-1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="0.684" y1="0.6" x2="-0.684" y2="0.6" width="0.2032" layer="21"/>
<wire x1="-0.684" y1="-0.6" x2="0.684" y2="-0.6" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0207R">
<description>&lt;b&gt;CECC Size RC6123&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-2.8" y1="-1" x2="2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="1" x2="-2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="-2.8" y1="1" x2="-2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="1.2125" y1="1" x2="-1.2125" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.2125" y1="-1" x2="1.2125" y2="-1" width="0.2032" layer="21"/>
<smd name="1" x="-2.25" y="0" dx="1.6" dy="2.5" layer="1"/>
<smd name="2" x="2.25" y="0" dx="1.6" dy="2.5" layer="1"/>
<text x="-2.2225" y="1.5875" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.2225" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0207W">
<description>&lt;b&gt;CECC Size RC6123&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-2.8" y1="-1" x2="2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="1" x2="-2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="-2.8" y1="1" x2="-2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="1.149" y1="1" x2="-1.149" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.149" y1="-1" x2="1.149" y2="-1" width="0.2032" layer="21"/>
<smd name="1" x="-2.6" y="0" dx="2.4" dy="2.5" layer="1"/>
<smd name="2" x="2.6" y="0" dx="2.4" dy="2.5" layer="1"/>
<text x="-2.54" y="1.5875" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="0922V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0922, grid 7.5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.81" y2="0" width="0.8128" layer="51"/>
<circle x="-5.08" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="-5.08" y="0" radius="1.905" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.508" y="1.6764" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.508" y="-2.9972" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="2.54" size="1.016" layer="21" ratio="12">0922</text>
<rectangle x1="-3.81" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="RDH/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type RDH, grid 15 mm</description>
<wire x1="-7.62" y1="0" x2="-6.858" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.096" y1="3.048" x2="-5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="2.794" x2="-5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-3.048" x2="-5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-2.794" x2="-5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.794" x2="5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.794" x2="-4.953" y2="2.794" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-2.794" x2="5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-2.794" x2="-4.953" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="6.096" y1="3.048" x2="5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.048" x2="5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.667" x2="-6.477" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="1.016" x2="-6.477" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="1.016" x2="-6.477" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-2.667" x2="6.477" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="6.477" y1="1.016" x2="6.477" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="6.477" y1="1.016" x2="6.477" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.858" y1="0" x2="7.62" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.477" y1="2.667" x2="-6.096" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="3.048" x2="6.477" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.477" y1="-2.667" x2="-6.096" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="6.096" y1="-3.048" x2="6.477" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="4.572" y="-1.7272" size="1.27" layer="51" ratio="10" rot="R90">RDH</text>
<rectangle x1="-6.7564" y1="-0.4064" x2="-6.4516" y2="0.4064" layer="51"/>
<rectangle x1="6.4516" y1="-0.4064" x2="6.7564" y2="0.4064" layer="51"/>
</package>
<package name="MINI_MELF-0102AX">
<description>&lt;b&gt;Mini MELF 0102 Axial&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.6" width="0" layer="51"/>
<circle x="0" y="0" radius="0.6" width="0" layer="52"/>
<smd name="1" x="0" y="0" dx="1.9" dy="1.9" layer="1" roundness="100"/>
<smd name="2" x="0" y="0" dx="1.9" dy="1.9" layer="16" roundness="100"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
<hole x="0" y="0" drill="1.3"/>
</package>
<package name="R0201">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; chip&lt;p&gt;
Source: http://www.vishay.com/docs/20008/dcrcw.pdf</description>
<smd name="1" x="-0.255" y="0" dx="0.28" dy="0.43" layer="1"/>
<smd name="2" x="0.255" y="0" dx="0.28" dy="0.43" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.15" y2="0.15" layer="51"/>
<rectangle x1="0.15" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="-0.15" x2="0.15" y2="0.15" layer="21"/>
</package>
<package name="VTA52">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR52&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-15.24" y1="0" x2="-13.97" y2="0" width="0.6096" layer="51"/>
<wire x1="12.6225" y1="0.025" x2="12.6225" y2="4.725" width="0.1524" layer="21"/>
<wire x1="12.6225" y1="4.725" x2="-12.6225" y2="4.725" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="4.725" x2="-12.6225" y2="0.025" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="0.025" x2="-12.6225" y2="-4.65" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="-4.65" x2="12.6225" y2="-4.65" width="0.1524" layer="21"/>
<wire x1="12.6225" y1="-4.65" x2="12.6225" y2="0.025" width="0.1524" layer="21"/>
<wire x1="13.97" y1="0" x2="15.24" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-15.24" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-13.97" y1="-0.3048" x2="-12.5675" y2="0.3048" layer="21"/>
<rectangle x1="12.5675" y1="-0.3048" x2="13.97" y2="0.3048" layer="21"/>
</package>
<package name="VTA53">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR53&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-12.065" y1="0" x2="-10.795" y2="0" width="0.6096" layer="51"/>
<wire x1="9.8975" y1="0" x2="9.8975" y2="4.7" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="4.7" x2="-9.8975" y2="4.7" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="4.7" x2="-9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="0" x2="-9.8975" y2="-4.675" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="-4.675" x2="9.8975" y2="-4.675" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="-4.675" x2="9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="10.795" y1="0" x2="12.065" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.065" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="12.065" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-0.3048" x2="-9.8425" y2="0.3048" layer="21"/>
<rectangle x1="9.8425" y1="-0.3048" x2="10.795" y2="0.3048" layer="21"/>
</package>
<package name="VTA54">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR54&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-12.065" y1="0" x2="-10.795" y2="0" width="0.6096" layer="51"/>
<wire x1="9.8975" y1="0" x2="9.8975" y2="3.3" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="3.3" x2="-9.8975" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="3.3" x2="-9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="0" x2="-9.8975" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="-3.3" x2="9.8975" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="-3.3" x2="9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="10.795" y1="0" x2="12.065" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.065" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="12.065" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-0.3048" x2="-9.8425" y2="0.3048" layer="21"/>
<rectangle x1="9.8425" y1="-0.3048" x2="10.795" y2="0.3048" layer="21"/>
</package>
<package name="VTA55">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR55&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-8.255" y1="0" x2="-6.985" y2="0" width="0.6096" layer="51"/>
<wire x1="6.405" y1="0" x2="6.405" y2="3.3" width="0.1524" layer="21"/>
<wire x1="6.405" y1="3.3" x2="-6.405" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="3.3" x2="-6.405" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="0" x2="-6.405" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="-3.3" x2="6.405" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="6.405" y1="-3.3" x2="6.405" y2="0" width="0.1524" layer="21"/>
<wire x1="6.985" y1="0" x2="8.255" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-8.255" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="8.255" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.985" y1="-0.3048" x2="-6.35" y2="0.3048" layer="21"/>
<rectangle x1="6.35" y1="-0.3048" x2="6.985" y2="0.3048" layer="21"/>
</package>
<package name="VTA56">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR56&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="4.5" y1="0" x2="4.5" y2="3.3" width="0.1524" layer="21"/>
<wire x1="4.5" y1="3.3" x2="-4.5" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-4.5" y2="0" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="0" x2="-4.5" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="-3.3" x2="4.5" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="4.5" y1="-3.3" x2="4.5" y2="0" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0" x2="6.35" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.08" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.08" y2="0.3048" layer="21"/>
</package>
<package name="VMTA55">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RNC55&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-5.08" y1="0" x2="-4.26" y2="0" width="0.6096" layer="51"/>
<wire x1="3.3375" y1="-1.45" x2="3.3375" y2="1.45" width="0.1524" layer="21"/>
<wire x1="3.3375" y1="1.45" x2="-3.3625" y2="1.45" width="0.1524" layer="21"/>
<wire x1="-3.3625" y1="1.45" x2="-3.3625" y2="-1.45" width="0.1524" layer="21"/>
<wire x1="-3.3625" y1="-1.45" x2="3.3375" y2="-1.45" width="0.1524" layer="21"/>
<wire x1="4.235" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.1" shape="octagon"/>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.26" y1="-0.3048" x2="-3.3075" y2="0.3048" layer="21"/>
<rectangle x1="3.2825" y1="-0.3048" x2="4.235" y2="0.3048" layer="21"/>
</package>
<package name="VMTB60">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RNC60&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-6.35" y1="0" x2="-5.585" y2="0" width="0.6096" layer="51"/>
<wire x1="4.6875" y1="-1.95" x2="4.6875" y2="1.95" width="0.1524" layer="21"/>
<wire x1="4.6875" y1="1.95" x2="-4.6875" y2="1.95" width="0.1524" layer="21"/>
<wire x1="-4.6875" y1="1.95" x2="-4.6875" y2="-1.95" width="0.1524" layer="21"/>
<wire x1="-4.6875" y1="-1.95" x2="4.6875" y2="-1.95" width="0.1524" layer="21"/>
<wire x1="5.585" y1="0" x2="6.35" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.1" shape="octagon"/>
<text x="-4.445" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.585" y1="-0.3048" x2="-4.6325" y2="0.3048" layer="21"/>
<rectangle x1="4.6325" y1="-0.3048" x2="5.585" y2="0.3048" layer="21"/>
</package>
<package name="R4527">
<description>&lt;b&gt;Package 4527&lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com/docs/31059/wsrhigh.pdf</description>
<wire x1="-5.675" y1="-3.375" x2="5.65" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.65" y1="-3.375" x2="5.65" y2="3.375" width="0.2032" layer="51"/>
<wire x1="5.65" y1="3.375" x2="-5.675" y2="3.375" width="0.2032" layer="21"/>
<wire x1="-5.675" y1="3.375" x2="-5.675" y2="-3.375" width="0.2032" layer="51"/>
<smd name="1" x="-4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.715" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.715" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC0001">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="-1.8" width="0.2032" layer="51"/>
<wire x1="-3.075" y1="-1.8" x2="3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="-1.8" x2="3.075" y2="1.8" width="0.2032" layer="51"/>
<wire x1="3.075" y1="1.8" x2="-3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="1.606" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="-1.606" x2="-3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="1.606" x2="3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="-1.8" x2="3.075" y2="-1.606" width="0.2032" layer="21"/>
<smd name="1" x="-2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<smd name="2" x="2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<text x="-2.544" y="2.229" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.544" y="-3.501" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC0002">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-5.55" y1="3.375" x2="-5.55" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-5.55" y1="-3.375" x2="5.55" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.55" y1="-3.375" x2="5.55" y2="3.375" width="0.2032" layer="51"/>
<wire x1="5.55" y1="3.375" x2="-5.55" y2="3.375" width="0.2032" layer="21"/>
<smd name="1" x="-4.575" y="0.025" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.65" y="3.9" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.65" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC01/2">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-2.45" y1="1.475" x2="-2.45" y2="-1.475" width="0.2032" layer="51"/>
<wire x1="-2.45" y1="-1.475" x2="2.45" y2="-1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="-1.475" x2="2.45" y2="1.475" width="0.2032" layer="51"/>
<wire x1="2.45" y1="1.475" x2="-2.45" y2="1.475" width="0.2032" layer="21"/>
<wire x1="-2.45" y1="1.475" x2="-2.45" y2="1.106" width="0.2032" layer="21"/>
<wire x1="-2.45" y1="-1.106" x2="-2.45" y2="-1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="1.106" x2="2.45" y2="1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="-1.475" x2="2.45" y2="-1.106" width="0.2032" layer="21"/>
<smd name="1" x="-2.1" y="0" dx="2.16" dy="1.78" layer="1"/>
<smd name="2" x="2.1" y="0" dx="2.16" dy="1.78" layer="1"/>
<text x="-2.544" y="1.904" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.544" y="-3.176" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC2515">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="-1.8" width="0.2032" layer="51"/>
<wire x1="-3.075" y1="-1.8" x2="3.05" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="-1.8" x2="3.05" y2="1.8" width="0.2032" layer="51"/>
<wire x1="3.05" y1="1.8" x2="-3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="1.606" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="-1.606" x2="-3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="1.606" x2="3.05" y2="1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="-1.8" x2="3.05" y2="-1.606" width="0.2032" layer="21"/>
<smd name="1" x="-2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<smd name="2" x="2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<text x="-3.2" y="2.15" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.2" y="-3.4" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC4527">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-5.675" y1="3.4" x2="-5.675" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-5.675" y1="-3.375" x2="5.675" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.675" y1="-3.375" x2="5.675" y2="3.4" width="0.2032" layer="51"/>
<wire x1="5.675" y1="3.4" x2="-5.675" y2="3.4" width="0.2032" layer="21"/>
<smd name="1" x="-4.575" y="0.025" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.775" y="3.925" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.775" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC6927">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-8.65" y1="3.375" x2="-8.65" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-8.65" y1="-3.375" x2="8.65" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="8.65" y1="-3.375" x2="8.65" y2="3.375" width="0.2032" layer="51"/>
<wire x1="8.65" y1="3.375" x2="-8.65" y2="3.375" width="0.2032" layer="21"/>
<smd name="1" x="-7.95" y="0.025" dx="3.94" dy="5.97" layer="1"/>
<smd name="2" x="7.95" y="0" dx="3.94" dy="5.97" layer="1"/>
<text x="-8.75" y="3.9" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.75" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="R1218">
<description>&lt;b&gt;CRCW1218 Thick Film, Rectangular Chip Resistors&lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com .. dcrcw.pdf</description>
<wire x1="-0.913" y1="-2.219" x2="0.939" y2="-2.219" width="0.1524" layer="51"/>
<wire x1="0.913" y1="2.219" x2="-0.939" y2="2.219" width="0.1524" layer="51"/>
<smd name="1" x="-1.475" y="0" dx="1.05" dy="4.9" layer="1"/>
<smd name="2" x="1.475" y="0" dx="1.05" dy="4.9" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-2.3" x2="-0.9009" y2="2.3" layer="51"/>
<rectangle x1="0.9144" y1="-2.3" x2="1.6645" y2="2.3" layer="51"/>
</package>
<package name="1812X7R">
<description>&lt;b&gt;Chip Monolithic Ceramic Capacitors&lt;/b&gt; Medium Voltage High Capacitance for General Use&lt;p&gt;
Source: http://www.murata.com .. GRM43DR72E224KW01.pdf</description>
<wire x1="-1.1" y1="1.5" x2="1.1" y2="1.5" width="0.2032" layer="51"/>
<wire x1="1.1" y1="-1.5" x2="-1.1" y2="-1.5" width="0.2032" layer="51"/>
<wire x1="-0.6" y1="1.5" x2="0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-1.5" x2="-0.6" y2="-1.5" width="0.2032" layer="21"/>
<smd name="1" x="-1.425" y="0" dx="0.8" dy="3.5" layer="1"/>
<smd name="2" x="1.425" y="0" dx="0.8" dy="3.5" layer="1" rot="R180"/>
<text x="-1.9456" y="1.9958" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.9456" y="-3.7738" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.4" y1="-1.6" x2="-1.1" y2="1.6" layer="51"/>
<rectangle x1="1.1" y1="-1.6" x2="1.4" y2="1.6" layer="51" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="R-EU">
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="R-EU_" prefix="R" uservalue="yes">
<description>&lt;B&gt;RESISTOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="R-EU" x="0" y="0"/>
</gates>
<devices>
<device name="R0402" package="R0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0603" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805W" package="R0805W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1005" package="R1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206" package="R1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206W" package="R1206W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1210" package="R1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1210W" package="R1210W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2010" package="R2010">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2010W" package="R2010W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2012" package="R2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2012W" package="R2012W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2512" package="R2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2512W" package="R2512W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3216" package="R3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3216W" package="R3216W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3225" package="R3225">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3225W" package="R3225W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R5025" package="R5025">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R5025W" package="R5025W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R6332" package="R6332">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R6332W" package="R6332W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M0805" package="M0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M1206" package="M1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M1406" package="M1406">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2012" package="M2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2309" package="M2309">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M3216" package="M3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M3516" package="M3516">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M5923" package="M5923">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/5" package="0204/5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/7" package="0204/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/2V" package="0204V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/10" package="0207/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/12" package="0207/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/15" package="0207/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/2V" package="0207/2V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/5V" package="0207/5V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/7" package="0207/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/10" package="0309/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/12" package="0309/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/V" package="0309V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/12" package="0411/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/15" package="0411/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/3V" package="0411V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0414/15" package="0414/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0414/5V" package="0414V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/17" package="0617/17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/22" package="0617/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/5V" package="0617V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0922/22" package="0922/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0613/5V" package="P0613V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0613/15" package="P0613/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0817/22" package="P0817/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0817/7V" package="P0817V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V234/12" package="V234/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V235/17" package="V235/17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V526-0" package="V526-0">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102R" package="MINI_MELF-0102R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102W" package="MINI_MELF-0102W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0204R" package="MINI_MELF-0204R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0204W" package="MINI_MELF-0204W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0207R" package="MINI_MELF-0207R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0207W" package="MINI_MELF-0207W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0922V" package="0922V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RDH/15" package="RDH/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102AX" package="MINI_MELF-0102AX">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0201" package="R0201">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA52" package="VTA52">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA53" package="VTA53">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA54" package="VTA54">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA55" package="VTA55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA56" package="VTA56">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VMTA55" package="VMTA55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VMTB60" package="VMTB60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R4527" package="R4527">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC0001" package="WSC0001">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC0002" package="WSC0002">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC01/2" package="WSC01/2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC2515" package="WSC2515">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC4527" package="WSC4527">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC6927" package="WSC6927">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1218" package="R1218">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1812X7R" package="1812X7R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VDD">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.905" x2="0" y2="1.27" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VDD" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="VSS">
<wire x1="-1.27" y1="1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="1.27" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.905" x2="0" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VSS" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VDD" prefix="VDD">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VDD" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VSS" prefix="VSS">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VSS" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="cdrt">
<description>&lt;b&gt;Odpory, kondenzatory, diody, tranzistory&lt;/b&gt;</description>
<packages>
<package name="C46-25">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 4.6x2.5 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.2192" y="0.0254" drill="1.2" shape="octagon"/>
<pad name="2" x="1.2446" y="0.0508" drill="1.2" shape="octagon"/>
<wire x1="2.286" y1="1.2446" x2="2.286" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.2446" x2="-2.286" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.2446" x2="2.286" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.2446" x2="-2.286" y2="1.2446" width="0.1524" layer="21"/>
</package>
<package name="C46-30">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 4.6x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.2192" y="0.0254" drill="1.2" shape="octagon"/>
<pad name="2" x="1.2446" y="0.0508" drill="1.2" shape="octagon"/>
<wire x1="2.286" y1="1.4986" x2="2.286" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.4986" x2="-2.286" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.4986" x2="2.286" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.4986" x2="-2.286" y2="1.4986" width="0.1524" layer="21"/>
</package>
<package name="C46-38">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 4.6x3.8 mm</description>
<text x="-1.905" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.2192" y="0.0254" drill="1.2" shape="octagon"/>
<pad name="2" x="1.2446" y="0.0508" drill="1.2" shape="octagon"/>
<wire x1="2.286" y1="1.905" x2="2.286" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.905" x2="-2.286" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.905" x2="2.286" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.905" x2="-2.286" y2="1.905" width="0.1524" layer="21"/>
</package>
<package name="C75-25">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 35 mm, outline 7.5x2.5 mm</description>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="1.2446" x2="3.7592" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="1.2446" x2="-3.7592" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-1.2446" x2="3.7592" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="1.2446" x2="-3.7592" y2="1.2446" width="0.1524" layer="21"/>
</package>
<package name="C75-32">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x3.2 mm</description>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="1.6002" x2="3.7592" y2="-1.6002" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="1.6002" x2="-3.7592" y2="-1.6002" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-1.6002" x2="3.7592" y2="-1.6002" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="1.6002" x2="-3.7592" y2="1.6002" width="0.1524" layer="21"/>
</package>
<package name="C75-35">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x3.5 mm</description>
<text x="-3.175" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="1.7526" x2="3.7592" y2="-1.7526" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="1.7526" x2="-3.7592" y2="-1.7526" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-1.7526" x2="3.7592" y2="-1.7526" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="1.7526" x2="-3.7592" y2="1.7526" width="0.1524" layer="21"/>
</package>
<package name="C75-45">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x4.5 mm</description>
<text x="-3.175" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="2.2606" x2="3.7592" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="2.2606" x2="-3.7592" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-2.2606" x2="3.7592" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="2.2606" x2="-3.7592" y2="2.2606" width="0.1524" layer="21"/>
</package>
<package name="C75-50">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 13.7 x 37.4 mm</description>
<text x="-3.175" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="2.4892" x2="3.7592" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="2.4892" x2="-3.7592" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-2.4892" x2="3.7592" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="2.4892" x2="-3.7592" y2="2.4892" width="0.1524" layer="21"/>
</package>
<package name="C75-55">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x5.5 mm</description>
<text x="-3.175" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="2.7432" x2="3.7592" y2="-2.7432" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="2.7432" x2="-3.7592" y2="-2.7432" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-2.7432" x2="3.7592" y2="-2.7432" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="2.7432" x2="-3.7592" y2="2.7432" width="0.1524" layer="21"/>
</package>
<package name="C75-60">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x6.0 mm</description>
<text x="-3.175" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="2.9972" x2="3.7592" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="2.9972" x2="-3.7592" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-2.9972" x2="3.7592" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="2.9972" x2="-3.7592" y2="2.9972" width="0.1524" layer="21"/>
</package>
<package name="C75-65">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x6.5 mm</description>
<text x="-3.175" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="3.2512" x2="3.7592" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="3.2512" x2="-3.7592" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-3.2512" x2="3.7592" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="3.2512" x2="-3.7592" y2="3.2512" width="0.1524" layer="21"/>
</package>
<package name="C75-72">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x7.2 mm</description>
<text x="-3.175" y="4.445" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-6.35" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="3.6068" x2="3.7592" y2="-3.6068" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="3.6068" x2="-3.7592" y2="-3.6068" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-3.6068" x2="3.7592" y2="-3.6068" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="3.6068" x2="-3.7592" y2="3.6068" width="0.1524" layer="21"/>
</package>
<package name="C75-85">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x8.5 mm</description>
<text x="-3.175" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-6.985" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.2" shape="octagon"/>
<wire x1="3.7592" y1="4.2418" x2="3.7592" y2="-4.2418" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="4.2418" x2="-3.7592" y2="-4.2418" width="0.1524" layer="21"/>
<wire x1="-3.7592" y1="-4.2418" x2="3.7592" y2="-4.2418" width="0.1524" layer="21"/>
<wire x1="3.7592" y1="4.2418" x2="-3.7592" y2="4.2418" width="0.1524" layer="21"/>
</package>
<package name="C90-45">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 9.0x4.5 mm</description>
<text x="-4.445" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="4.4958" y1="2.2606" x2="4.4958" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="-4.4958" y1="2.2606" x2="-4.4958" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="-4.4958" y1="-2.2606" x2="4.4958" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="4.4958" y1="2.2606" x2="-4.4958" y2="2.2606" width="0.1524" layer="21"/>
</package>
<package name="C105-30">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x3.0 mm</description>
<text x="-4.445" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="1.4986" x2="5.2324" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="1.4986" x2="-5.2324" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-1.4986" x2="5.2324" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="1.4986" x2="-5.2324" y2="1.4986" width="0.1524" layer="21"/>
</package>
<package name="C105-25">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x2.5 mm</description>
<text x="-4.445" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="1.2446" x2="5.2324" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="1.2446" x2="-5.2324" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-1.2446" x2="5.2324" y2="-1.2446" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="1.2446" x2="-5.2324" y2="1.2446" width="0.1524" layer="21"/>
</package>
<package name="C105-35">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x3.5 mm</description>
<text x="-4.445" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="1.7526" x2="5.2324" y2="-1.7526" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="1.7526" x2="-5.2324" y2="-1.7526" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-1.7526" x2="5.2324" y2="-1.7526" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="1.7526" x2="-5.2324" y2="1.7526" width="0.1524" layer="21"/>
</package>
<package name="C105-40">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x4.0 mm</description>
<text x="-4.445" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="1.9812" x2="5.2324" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="1.9812" x2="-5.2324" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-1.9812" x2="5.2324" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="1.9812" x2="-5.2324" y2="1.9812" width="0.1524" layer="21"/>
</package>
<package name="C105-45">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x4.5 mm</description>
<text x="-4.445" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="2.2606" x2="5.2324" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="2.2606" x2="-5.2324" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-2.2606" x2="5.2324" y2="-2.2606" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="2.2606" x2="-5.2324" y2="2.2606" width="0.1524" layer="21"/>
</package>
<package name="C105-50">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x5.0 mm</description>
<text x="-4.445" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="2.4892" x2="5.2324" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="2.4892" x2="-5.2324" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-2.4892" x2="5.2324" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="2.4892" x2="-5.2324" y2="2.4892" width="0.1524" layer="21"/>
</package>
<package name="C105-60">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 10.5x6.0 mm</description>
<text x="-4.445" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-3.81" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="1.2" shape="octagon"/>
<wire x1="5.2324" y1="2.9972" x2="5.2324" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="2.9972" x2="-5.2324" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-5.2324" y1="-2.9972" x2="5.2324" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="5.2324" y1="2.9972" x2="-5.2324" y2="2.9972" width="0.1524" layer="21"/>
</package>
<package name="C130-30">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 10 mm, outline 13.0x3.0 mm</description>
<text x="-5.715" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.2" shape="octagon"/>
<wire x1="6.5024" y1="1.4986" x2="6.5024" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="1.4986" x2="-6.5024" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="-1.4986" x2="6.5024" y2="-1.4986" width="0.1524" layer="21"/>
<wire x1="6.5024" y1="1.4986" x2="-6.5024" y2="1.4986" width="0.1524" layer="21"/>
</package>
<package name="C130-40">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 10 mm, outline 13.0x4.0 mm</description>
<text x="-5.715" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.2" shape="octagon"/>
<wire x1="6.5024" y1="1.9812" x2="6.5024" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="1.9812" x2="-6.5024" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="-1.9812" x2="6.5024" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="6.5024" y1="1.9812" x2="-6.5024" y2="1.9812" width="0.1524" layer="21"/>
</package>
<package name="C130-50">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 10 mm, outline 13.0x5.0 mm</description>
<text x="-5.715" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.2" shape="octagon"/>
<wire x1="6.5024" y1="2.4892" x2="6.5024" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="2.4892" x2="-6.5024" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="-2.4892" x2="6.5024" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="6.5024" y1="2.4892" x2="-6.5024" y2="2.4892" width="0.1524" layer="21"/>
</package>
<package name="C130-60">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 10 mm, outline 13.0x6.0 mm</description>
<text x="-5.715" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.2" shape="octagon"/>
<wire x1="6.5024" y1="2.9972" x2="6.5024" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="2.9972" x2="-6.5024" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-6.5024" y1="-2.9972" x2="6.5024" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="6.5024" y1="2.9972" x2="-6.5024" y2="2.9972" width="0.1524" layer="21"/>
</package>
<package name="C180-50">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 18.0x5.0 mm</description>
<text x="-7.62" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-7.62" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.2" shape="octagon"/>
<wire x1="8.9916" y1="2.4892" x2="8.9916" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="2.4892" x2="-8.9916" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="-2.4892" x2="8.9916" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="8.9916" y1="2.4892" x2="-8.9916" y2="2.4892" width="0.1524" layer="21"/>
</package>
<package name="C180-60">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 18.0x6.0 mm</description>
<text x="-7.62" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-7.62" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.2" shape="octagon"/>
<wire x1="8.9916" y1="2.9972" x2="8.9916" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="2.9972" x2="-8.9916" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="-2.9972" x2="8.9916" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="8.9916" y1="2.9972" x2="-8.9916" y2="2.9972" width="0.1524" layer="21"/>
</package>
<package name="C180-70">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 18.0x7.0 mm</description>
<text x="-7.62" y="4.445" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-6.35" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-7.62" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.2" shape="octagon"/>
<wire x1="8.9916" y1="3.5052" x2="8.9916" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="3.5052" x2="-8.9916" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="-3.5052" x2="8.9916" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="8.9916" y1="3.5052" x2="-8.9916" y2="3.5052" width="0.1524" layer="21"/>
</package>
<package name="C180-80">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 18.0x8.0 mm</description>
<text x="-7.62" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-6.985" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-7.62" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.2" shape="octagon"/>
<wire x1="8.9916" y1="4.0132" x2="8.9916" y2="-4.0132" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="4.0132" x2="-8.9916" y2="-4.0132" width="0.1524" layer="21"/>
<wire x1="-8.9916" y1="-4.0132" x2="8.9916" y2="-4.0132" width="0.1524" layer="21"/>
<wire x1="8.9916" y1="4.0132" x2="-8.9916" y2="4.0132" width="0.1524" layer="21"/>
</package>
<package name="C265-50">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x5.0 mm</description>
<text x="-12.065" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="2.4892" x2="13.2588" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="2.4892" x2="-13.2588" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-2.4892" x2="13.2588" y2="-2.4892" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="2.4892" x2="-13.2588" y2="2.4892" width="0.1524" layer="21"/>
</package>
<package name="C265-60">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x6.0 mm</description>
<text x="-12.065" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="2.9972" x2="13.2588" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="2.9972" x2="-13.2588" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-2.9972" x2="13.2588" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="2.9972" x2="-13.2588" y2="2.9972" width="0.1524" layer="21"/>
</package>
<package name="C265-70">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x7.0 mm</description>
<text x="-12.065" y="4.445" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-6.35" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="3.5052" x2="13.2588" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="3.5052" x2="-13.2588" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-3.5052" x2="13.2588" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="3.5052" x2="-13.2588" y2="3.5052" width="0.1524" layer="21"/>
</package>
<package name="C265-85">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x8.5 mm</description>
<text x="-12.065" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-6.985" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="4.2418" x2="13.2588" y2="-4.2672" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="4.2418" x2="-13.2588" y2="-4.2672" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-4.2672" x2="13.2588" y2="-4.2672" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="4.2418" x2="-13.2588" y2="4.2418" width="0.1524" layer="21"/>
</package>
<package name="C265-100">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x10.0 mm</description>
<text x="-12.065" y="5.715" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="4.9784" x2="13.2588" y2="-4.9784" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="4.9784" x2="-13.2588" y2="-4.9784" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-4.9784" x2="13.2588" y2="-4.9784" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="4.9784" x2="-13.2588" y2="4.9784" width="0.1524" layer="21"/>
</package>
<package name="C265-105">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x10.5 mm</description>
<text x="-12.065" y="5.715" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="5.2324" x2="13.2588" y2="-5.2324" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="5.2324" x2="-13.2588" y2="-5.2324" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-5.2324" x2="13.2588" y2="-5.2324" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="5.2324" x2="-13.2588" y2="5.2324" width="0.1524" layer="21"/>
</package>
<package name="C265-110">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 26.5x11.0 mm</description>
<text x="-12.065" y="6.35" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.065" y="-8.255" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.2" shape="octagon"/>
<wire x1="13.2588" y1="5.4864" x2="13.2588" y2="-5.4864" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="5.4864" x2="-13.2588" y2="-5.4864" width="0.1524" layer="21"/>
<wire x1="-13.2588" y1="-5.4864" x2="13.2588" y2="-5.4864" width="0.1524" layer="21"/>
<wire x1="13.2588" y1="5.4864" x2="-13.2588" y2="5.4864" width="0.1524" layer="21"/>
</package>
<package name="C315-90">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 31.5x9.0 mm</description>
<text x="-14.605" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-14.605" y="-6.985" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-13.97" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="13.97" y="0" drill="1.2" shape="octagon"/>
<wire x1="15.748" y1="4.4958" x2="15.748" y2="-4.4958" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="4.4958" x2="-15.748" y2="-4.4958" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-4.4958" x2="15.748" y2="-4.4958" width="0.1524" layer="21"/>
<wire x1="15.748" y1="4.4958" x2="-15.748" y2="4.4958" width="0.1524" layer="21"/>
</package>
<package name="C315-110">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 31.5x11.0 mm</description>
<text x="-14.605" y="6.35" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-14.605" y="-8.255" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-13.97" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="13.97" y="0" drill="1.2" shape="octagon"/>
<wire x1="15.748" y1="5.4864" x2="15.748" y2="-5.4864" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="5.4864" x2="-15.748" y2="-5.4864" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-5.4864" x2="15.748" y2="-5.4864" width="0.1524" layer="21"/>
<wire x1="15.748" y1="5.4864" x2="-15.748" y2="5.4864" width="0.1524" layer="21"/>
</package>
<package name="C315-130">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 31.5x13.0 mm</description>
<text x="-14.605" y="6.985" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-14.605" y="-8.89" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-13.97" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="13.97" y="0" drill="1.2" shape="octagon"/>
<wire x1="15.748" y1="6.5024" x2="15.748" y2="-6.5024" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="6.5024" x2="-15.748" y2="-6.5024" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-6.5024" x2="15.748" y2="-6.5024" width="0.1524" layer="21"/>
<wire x1="15.748" y1="6.5024" x2="-15.748" y2="6.5024" width="0.1524" layer="21"/>
</package>
<package name="C315-150">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 31.5x15.0 mm</description>
<text x="-14.605" y="8.255" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-14.605" y="-10.16" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-13.97" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="13.97" y="0" drill="1.2" shape="octagon"/>
<wire x1="15.748" y1="7.5184" x2="15.748" y2="-7.5184" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="7.5184" x2="-15.748" y2="-7.5184" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-7.5184" x2="15.748" y2="-7.5184" width="0.1524" layer="21"/>
<wire x1="15.748" y1="7.5184" x2="-15.748" y2="7.5184" width="0.1524" layer="21"/>
</package>
<package name="C315-170">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 31.5x17.0 mm</description>
<text x="-14.605" y="9.525" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-14.605" y="-11.43" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-13.97" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="13.97" y="0" drill="1.2" shape="octagon"/>
<wire x1="15.748" y1="8.4836" x2="15.748" y2="-8.4836" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="8.4836" x2="-15.748" y2="-8.4836" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-8.4836" x2="15.748" y2="-8.4836" width="0.1524" layer="21"/>
<wire x1="15.748" y1="8.4836" x2="-15.748" y2="8.4836" width="0.1524" layer="21"/>
</package>
<package name="C415-130">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 37.5 mm, outline 41.5x13.0 mm</description>
<text x="-19.685" y="7.62" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-19.685" y="-9.525" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-19.05" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="19.05" y="0" drill="1.2" shape="octagon"/>
<wire x1="20.7264" y1="6.5024" x2="20.7264" y2="-6.5024" width="0.1524" layer="21"/>
<wire x1="-20.7264" y1="6.5024" x2="-20.7264" y2="-6.5024" width="0.1524" layer="21"/>
<wire x1="-20.7264" y1="-6.5024" x2="20.7264" y2="-6.5024" width="0.1524" layer="21"/>
<wire x1="20.7264" y1="6.5024" x2="-20.7264" y2="6.5024" width="0.1524" layer="21"/>
</package>
<package name="C415-170">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 37.5 mm, outline 41.5x17.0 mm</description>
<text x="-19.685" y="9.525" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-19.685" y="-11.43" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-19.05" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="19.05" y="0" drill="1.2" shape="octagon"/>
<wire x1="20.7264" y1="8.4836" x2="20.7264" y2="-8.4836" width="0.1524" layer="21"/>
<wire x1="-20.7264" y1="8.4836" x2="-20.7264" y2="-8.4836" width="0.1524" layer="21"/>
<wire x1="-20.7264" y1="-8.4836" x2="20.7264" y2="-8.4836" width="0.1524" layer="21"/>
<wire x1="20.7264" y1="8.4836" x2="-20.7264" y2="8.4836" width="0.1524" layer="21"/>
</package>
<package name="C415-190">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;&lt;p&gt;
grid 37.5 mm, outline 41.5x19.0 mm</description>
<text x="-19.685" y="10.16" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-19.685" y="-12.065" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-19.05" y="0" drill="1.2" shape="octagon"/>
<pad name="2" x="19.05" y="0" drill="1.2" shape="octagon"/>
<wire x1="20.7264" y1="9.4996" x2="20.7264" y2="-9.4996" width="0.1524" layer="21"/>
<wire x1="-20.7264" y1="9.4996" x2="-20.7264" y2="-9.4996" width="0.1524" layer="21"/>
<wire x1="-20.7264" y1="-9.4996" x2="20.7264" y2="-9.4996" width="0.1524" layer="21"/>
<wire x1="20.7264" y1="9.4996" x2="-20.7264" y2="9.4996" width="0.1524" layer="21"/>
</package>
<package name="CKERAM">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 5.0x2.5 mm</description>
<text x="-1.905" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.778" y="-0.508" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="2.413" y1="0.5588" x2="1.27" y2="1.27" width="0.1524" layer="21" curve="64.0098"/>
<wire x1="1.27" y1="1.27" x2="-1.27" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-2.413" y2="0.5588" width="0.1524" layer="21" curve="64.0098"/>
<wire x1="2.413" y1="-0.5588" x2="1.27" y2="-1.27" width="0.1524" layer="21" curve="-64.0098"/>
<wire x1="1.27" y1="-1.27" x2="-1.27" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-2.413" y2="-0.5588" width="0.1524" layer="21" curve="-64.0098"/>
</package>
<package name="CKERAM3">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5+2.5 mm, outline 5.0x2.5 mm</description>
<text x="-1.905" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<pad name="3" x="0" y="0" drill="1" shape="octagon"/>
<wire x1="2.413" y1="0.5588" x2="1.27" y2="1.27" width="0.1524" layer="21" curve="64.0098"/>
<wire x1="1.27" y1="1.27" x2="-1.27" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-2.413" y2="0.5588" width="0.1524" layer="21" curve="64.0098"/>
<wire x1="2.413" y1="-0.5588" x2="1.27" y2="-1.27" width="0.1524" layer="21" curve="-64.0098"/>
<wire x1="1.27" y1="-1.27" x2="-1.27" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-2.413" y2="-0.5588" width="0.1524" layer="21" curve="-64.0098"/>
</package>
<package name="CK25-50">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 5.0x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1" shape="octagon"/>
<wire x1="-1.0162" y1="1.524" x2="1.0162" y2="1.524" width="0.1524" layer="21"/>
<wire x1="1.0162" y1="1.524" x2="1.0162" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="1.0162" y1="-1.524" x2="-1.0162" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.0162" y1="-1.524" x2="-1.0162" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK25-60">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 6.0x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1" shape="octagon"/>
<wire x1="-1.4732" y1="1.524" x2="1.4732" y2="1.524" width="0.1524" layer="21"/>
<wire x1="1.4732" y1="1.524" x2="1.4732" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="1.4732" y1="-1.524" x2="-1.4732" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.4732" y1="-1.524" x2="-1.4732" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK25-75">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 7.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1" shape="octagon"/>
<wire x1="-2.2352" y1="1.524" x2="2.2352" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.2352" y1="1.524" x2="2.2352" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.2352" y1="-1.524" x2="-2.2352" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.2352" y1="-1.524" x2="-2.2352" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK25-85">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 8.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1" shape="octagon"/>
<wire x1="-2.7432" y1="1.524" x2="2.7432" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.7432" y1="1.524" x2="2.7432" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.7432" y1="-1.524" x2="-2.7432" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.7432" y1="-1.524" x2="-2.7432" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-38">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 3.8x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-0.3556" y1="1.524" x2="0.3556" y2="1.524" width="0.1524" layer="21"/>
<wire x1="0.3556" y1="1.524" x2="0.3556" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="0.3556" y1="-1.524" x2="-0.3556" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.3556" y1="-1.524" x2="-0.3556" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-50">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 5.0x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="1.27" y1="-1.524" x2="-1.27" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.524" x2="1.27" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.524" x2="-2.54" y2="0.8636" width="0.1524" layer="21" curve="56.018"/>
<wire x1="1.27" y1="1.524" x2="2.54" y2="0.8636" width="0.1524" layer="21" curve="-56.018"/>
<wire x1="1.27" y1="-1.524" x2="2.54" y2="-0.8636" width="0.1524" layer="21" curve="56.018"/>
<wire x1="-1.27" y1="-1.524" x2="-2.54" y2="-0.8636" width="0.1524" layer="21" curve="-56.018"/>
</package>
<package name="CK50-60">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 6.0x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-1.7272" y1="1.524" x2="1.7272" y2="1.524" width="0.1524" layer="21"/>
<wire x1="1.7272" y1="1.524" x2="1.7272" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="1.7272" y1="-1.524" x2="-1.7272" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.7272" y1="-1.524" x2="-1.7272" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-75">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-2.2352" y1="1.524" x2="2.2352" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.2352" y1="1.524" x2="2.2352" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.2352" y1="-1.524" x2="-2.2352" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.2352" y1="-1.524" x2="-2.2352" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-80">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 8.0x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-2.4892" y1="1.524" x2="2.4892" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.4892" y1="1.524" x2="2.4892" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.4892" y1="-1.524" x2="-2.4892" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.4892" y1="-1.524" x2="-2.4892" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-85">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 8.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-2.7432" y1="1.524" x2="2.7432" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.7432" y1="1.524" x2="2.7432" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.7432" y1="-1.524" x2="-2.7432" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.7432" y1="-1.524" x2="-2.7432" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-95">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 9.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-3.2004" y1="1.524" x2="3.2004" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.2004" y1="1.524" x2="3.2004" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="3.2004" y1="-1.524" x2="-3.2004" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.2004" y1="-1.524" x2="-3.2004" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-105">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 10.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-3.7084" y1="1.524" x2="3.7084" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.7084" y1="1.524" x2="3.7084" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="3.7084" y1="-1.524" x2="-3.7084" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.7084" y1="-1.524" x2="-3.7084" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-115">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 11.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-4.318" y1="1.524" x2="4.318" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="1.524" x2="4.318" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="4.318" y1="-1.524" x2="-4.318" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-1.524" x2="-4.318" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CK50-125">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 12.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-4.7244" y1="1.524" x2="4.7244" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.7244" y1="1.524" x2="4.7244" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="4.7244" y1="-1.524" x2="-4.7244" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.7244" y1="-1.524" x2="-4.7244" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="CAX18X30-35">
<description>&lt;b&gt;Kondenzator axialni svitkovy&lt;/b&gt;&lt;p&gt;
pouzdro 18x30 mm, vyvody 35mm</description>
<text x="-2.54" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-17.78" y="0" drill="1" shape="octagon"/>
<pad name="2" x="17.78" y="0" drill="1" shape="octagon"/>
<wire x1="-14.986" y1="9.017" x2="14.986" y2="9.017" width="0.1524" layer="21"/>
<wire x1="14.986" y1="9.017" x2="14.986" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-9.017" x2="-14.986" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-9.017" x2="-14.986" y2="9.017" width="0.1524" layer="21"/>
<rectangle x1="-16.891" y1="-0.381" x2="-14.986" y2="0.381" layer="21"/>
<rectangle x1="14.986" y1="-0.381" x2="16.891" y2="0.381" layer="21"/>
</package>
<package name="CAX18X30-37">
<description>&lt;b&gt;Kondenzator axialni svitkovy&lt;/b&gt;&lt;p&gt;
pouzdro 18x30 mm, vyvody 37mm</description>
<text x="-2.54" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-19.05" y="0" drill="1" shape="octagon"/>
<pad name="2" x="19.05" y="0" drill="1" shape="octagon"/>
<wire x1="-14.986" y1="9.017" x2="14.986" y2="9.017" width="0.1524" layer="21"/>
<wire x1="14.986" y1="9.017" x2="14.986" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-9.017" x2="-14.986" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-9.017" x2="-14.986" y2="9.017" width="0.1524" layer="21"/>
<rectangle x1="-18.161" y1="-0.381" x2="-14.986" y2="0.381" layer="21"/>
<rectangle x1="14.986" y1="-0.381" x2="18.161" y2="0.381" layer="21"/>
</package>
<package name="CAX18X30-40">
<description>&lt;b&gt;Kondenzator axialni svitkovy&lt;/b&gt;&lt;p&gt;
pouzdro 18x30 mm, vyvody 40mm</description>
<text x="-2.54" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-20.32" y="0" drill="1" shape="octagon"/>
<pad name="2" x="20.32" y="0" drill="1" shape="octagon"/>
<wire x1="-14.986" y1="9.017" x2="14.986" y2="9.017" width="0.1524" layer="21"/>
<wire x1="14.986" y1="9.017" x2="14.986" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-9.017" x2="-14.986" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-9.017" x2="-14.986" y2="9.017" width="0.1524" layer="21"/>
<rectangle x1="-19.431" y1="-0.381" x2="-14.986" y2="0.381" layer="21"/>
<rectangle x1="14.986" y1="-0.381" x2="19.431" y2="0.381" layer="21"/>
</package>
<package name="CK50-145">
<description>&lt;b&gt;Kondenzator keramicky&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 14.5x3.0 mm</description>
<text x="-1.905" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1" shape="octagon"/>
<wire x1="-5.207" y1="1.524" x2="5.207" y2="1.524" width="0.1524" layer="21"/>
<wire x1="5.207" y1="1.524" x2="5.207" y2="-1.524" width="0.1524" layer="21" curve="-180"/>
<wire x1="5.207" y1="-1.524" x2="-5.207" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="-1.524" x2="-5.207" y2="1.524" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="0805">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip</description>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<smd name="1" x="-0.8382" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.8382" y="0" dx="1.3" dy="1.5" layer="1"/>
<wire x1="-0.9906" y1="0.635" x2="0.9906" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="0.635" x2="0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="-0.635" x2="-0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.9906" y1="-0.635" x2="-0.9906" y2="0.635" width="0.1524" layer="21"/>
<rectangle x1="-0.2032" y1="-0.508" x2="0.2032" y2="0.508" layer="35"/>
</package>
<package name="0805N">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip - neosazovat</description>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<smd name="1" x="-0.8382" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.8382" y="0" dx="1.3" dy="1.5" layer="1"/>
<wire x1="-0.9906" y1="0.635" x2="0.9906" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="0.635" x2="0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="-0.635" x2="-0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.9906" y1="-0.635" x2="-0.9906" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="0.635" x2="-0.9906" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-0.9906" y1="0.635" x2="0.9906" y2="-0.635" width="0.1524" layer="51"/>
<rectangle x1="-0.2032" y1="-0.508" x2="0.2032" y2="0.508" layer="35"/>
</package>
<package name="0805W">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip</description>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<smd name="1" x="-0.9398" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="0.9398" y="0" dx="1.5" dy="1" layer="1"/>
<wire x1="-0.9906" y1="0.635" x2="0.9906" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="0.635" x2="0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="-0.635" x2="-0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.9906" y1="-0.635" x2="-0.9906" y2="0.635" width="0.1524" layer="21"/>
<rectangle x1="-0.2032" y1="-0.508" x2="0.2032" y2="0.508" layer="35"/>
</package>
<package name="0805WN">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip - neosazovat</description>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<smd name="1" x="-0.9398" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="0.9398" y="0" dx="1.5" dy="1" layer="1"/>
<wire x1="-0.9906" y1="0.635" x2="0.9906" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="0.635" x2="0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="-0.635" x2="-0.9906" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.9906" y1="-0.635" x2="-0.9906" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.9906" y1="0.635" x2="-0.9906" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-0.9906" y1="0.635" x2="0.9906" y2="-0.635" width="0.1524" layer="51"/>
<rectangle x1="-0.2032" y1="-0.508" x2="0.2032" y2="0.508" layer="35"/>
</package>
<package name="1206">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip</description>
<text x="-1.016" y="1.143" size="0.8128" layer="25">&gt;NAME</text>
<text x="-1.397" y="-0.381" size="0.8128" layer="27">&gt;VALUE</text>
<smd name="1" x="-1.4224" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="2" x="1.4224" y="0" dx="1.6" dy="1.803" layer="1"/>
<wire x1="-1.6002" y1="0.8128" x2="1.6002" y2="0.8128" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="0.8128" x2="1.6002" y2="-0.8128" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="-0.8128" x2="-1.6002" y2="-0.8128" width="0.1524" layer="21"/>
<wire x1="-1.6002" y1="-0.8128" x2="-1.6002" y2="0.8128" width="0.1524" layer="21"/>
<rectangle x1="-0.3048" y1="-0.7112" x2="0.3048" y2="0.7112" layer="35"/>
</package>
<package name="1206N">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip - neosazovat</description>
<text x="-1.016" y="1.143" size="0.8128" layer="25">&gt;NAME</text>
<text x="-1.397" y="-0.381" size="0.8128" layer="27">&gt;VALUE</text>
<smd name="1" x="-1.4224" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="2" x="1.4224" y="0" dx="1.6" dy="1.803" layer="1"/>
<wire x1="-1.6002" y1="0.8128" x2="1.6002" y2="0.8128" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="0.8128" x2="1.6002" y2="-0.8128" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="-0.8128" x2="-1.6002" y2="-0.8128" width="0.1524" layer="21"/>
<wire x1="-1.6002" y1="-0.8128" x2="-1.6002" y2="0.8128" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="0.8128" x2="-1.6002" y2="-0.8128" width="0.1524" layer="51"/>
<wire x1="-1.6002" y1="0.8128" x2="1.6002" y2="-0.8128" width="0.1524" layer="51"/>
<rectangle x1="-0.3048" y1="-0.7112" x2="0.3048" y2="0.7112" layer="35"/>
</package>
<package name="1206W">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip</description>
<text x="-1.016" y="1.143" size="0.8128" layer="25">&gt;NAME</text>
<text x="-1.397" y="-0.381" size="0.8128" layer="27">&gt;VALUE</text>
<smd name="1" x="-1.4986" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.4986" y="0" dx="1.8" dy="1.2" layer="1"/>
<wire x1="-1.5748" y1="0.7874" x2="1.5748" y2="0.7874" width="0.1524" layer="21"/>
<wire x1="1.5748" y1="0.7874" x2="1.5748" y2="-0.7874" width="0.1524" layer="21"/>
<wire x1="1.5748" y1="-0.7874" x2="-1.5748" y2="-0.7874" width="0.1524" layer="21"/>
<wire x1="-1.5748" y1="-0.7874" x2="-1.5748" y2="0.7874" width="0.1524" layer="21"/>
<rectangle x1="-0.3048" y1="-0.7112" x2="0.3048" y2="0.7112" layer="35"/>
</package>
<package name="1206WN">
<description>&lt;b&gt;Rezistor&lt;/b&gt; chip - neosazovat</description>
<text x="-1.016" y="1.143" size="0.8128" layer="25">&gt;NAME</text>
<text x="-1.397" y="-0.381" size="0.8128" layer="27">&gt;VALUE</text>
<smd name="1" x="-1.4986" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.4986" y="0" dx="1.8" dy="1.2" layer="1"/>
<wire x1="-1.5748" y1="0.7874" x2="1.5748" y2="0.7874" width="0.1524" layer="21"/>
<wire x1="1.5748" y1="0.7874" x2="1.5748" y2="-0.7874" width="0.1524" layer="21"/>
<wire x1="1.5748" y1="-0.7874" x2="-1.5748" y2="-0.7874" width="0.1524" layer="21"/>
<wire x1="-1.5748" y1="-0.7874" x2="-1.5748" y2="0.7874" width="0.1524" layer="21"/>
<wire x1="1.5748" y1="0.7874" x2="-1.5748" y2="-0.7874" width="0.1524" layer="51"/>
<wire x1="-1.5748" y1="0.7874" x2="1.5748" y2="-0.7874" width="0.1524" layer="51"/>
<rectangle x1="-0.3048" y1="-0.7112" x2="0.3048" y2="0.7112" layer="35"/>
</package>
</packages>
<symbols>
<symbol name="C">
<pin name="1" x="0" y="2.54" visible="off" length="point" direction="pas" swaplevel="1"/>
<pin name="2" x="0" y="-2.54" visible="off" length="point" direction="pas" swaplevel="1"/>
<text x="1.27" y="1.27" size="1.778" layer="95">&gt;NAME</text>
<text x="1.27" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="0" y1="2.54" x2="0" y2="0.762" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-0.762" width="0.1524" layer="94"/>
<rectangle x1="-2.0323" y1="-0.762" x2="2.0323" y2="-0.2534" layer="94"/>
<rectangle x1="-2.0323" y1="0.254" x2="2.0323" y2="0.7626" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C" prefix="C" uservalue="yes">
<description>&lt;b&gt;Kondenzator&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="C" x="0" y="0"/>
</gates>
<devices>
<device name="C46-25" package="C46-25">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C46-30" package="C46-30">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C46-38" package="C46-38">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-25" package="C75-25">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-32" package="C75-32">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-35" package="C75-35">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-45" package="C75-45">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-50" package="C75-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-55" package="C75-55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-60" package="C75-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-65" package="C75-65">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-72" package="C75-72">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C75-85" package="C75-85">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C90-45" package="C90-45">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-30" package="C105-30">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-25" package="C105-25">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-35" package="C105-35">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-40" package="C105-40">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-45" package="C105-45">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-50" package="C105-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C105-60" package="C105-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C130-30" package="C130-30">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C130-40" package="C130-40">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C130-50" package="C130-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C130-60" package="C130-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C180-50" package="C180-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C180-60" package="C180-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C180-70" package="C180-70">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C180-80" package="C180-80">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-50" package="C265-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-60" package="C265-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-70" package="C265-70">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-85" package="C265-85">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-100" package="C265-100">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-105" package="C265-105">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C265-110" package="C265-110">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C315-90" package="C315-90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C315-110" package="C315-110">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C315-130" package="C315-130">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C315-150" package="C315-150">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C315-170" package="C315-170">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C415-130" package="C415-130">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C415-170" package="C415-170">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C415-190" package="C415-190">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CKERAM" package="CKERAM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CKERAM3" package="CKERAM3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK25-50" package="CK25-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK25-60" package="CK25-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK25-75" package="CK25-75">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK25-85" package="CK25-85">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-38" package="CK50-38">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-50" package="CK50-50">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-60" package="CK50-60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-75" package="CK50-75">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-80" package="CK50-80">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-85" package="CK50-85">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-95" package="CK50-95">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-105" package="CK50-105">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-115" package="CK50-115">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-125" package="CK50-125">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CAX18X30-35" package="CAX18X30-35">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CAX18X30-37" package="CAX18X30-37">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CAX18X30-40" package="CAX18X30-40">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CK50-145" package="CK50-145">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805N" package="0805N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805W" package="0805W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805WN" package="0805WN">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206N" package="1206N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206W" package="1206W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206WN" package="1206WN">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="conect">
<description>&lt;b&gt;Konektory a propojovaci prvky&lt;/b&gt;</description>
<packages>
<package name="HEAD1X3">
<description>&lt;b&gt;Header 1x3&lt;/b&gt;</description>
<text x="-0.635" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="square" rot="R90"/>
<pad name="2" x="0" y="0" drill="1" shape="octagon" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1" shape="octagon" rot="R90"/>
<wire x1="-3.81" y1="-1.016" x2="-3.81" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.016" x2="-3.556" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="1.27" x2="-1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.27" x2="-1.27" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.016" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.016" x2="-1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-1.27" x2="-3.556" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-1.27" x2="-3.81" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.016" x2="-1.016" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.27" x2="1.016" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.27" x2="1.27" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.016" x2="1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.016" x2="1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-1.27" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.27" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.016" x2="1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.524" y1="1.27" x2="3.556" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.556" y1="1.27" x2="3.81" y2="1.016" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.016" x2="3.81" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.016" x2="3.556" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-1.27" x2="1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-1.27" x2="1.27" y2="-1.016" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="51">
<vertex x="-2.54" y="-1.905"/>
<vertex x="-2.921" y="-2.54"/>
<vertex x="-2.159" y="-2.54"/>
</polygon>
<rectangle x1="-2.8448" y1="-0.3048" x2="-2.2352" y2="0.3048" layer="51"/>
<rectangle x1="-0.3048" y1="-0.3048" x2="0.3048" y2="0.3048" layer="51"/>
<rectangle x1="2.2352" y1="-0.3048" x2="2.8448" y2="0.3048" layer="51"/>
</package>
<package name="HEAD1X3A">
<description>&lt;b&gt;Header 1x3/90°&lt;/b&gt;</description>
<text x="-2.54" y="-5.715" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="-2.54" drill="1" shape="square" rot="R90"/>
<pad name="2" x="0" y="-2.54" drill="1" shape="octagon" rot="R90"/>
<pad name="3" x="2.54" y="-2.54" drill="1" shape="octagon" rot="R90"/>
<wire x1="-3.81" y1="-0.254" x2="-3.81" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.7272" x2="-3.556" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="1.9812" x2="-1.524" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.9812" x2="-1.27" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.7272" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.254" x2="-1.524" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.508" x2="-3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-0.508" x2="-3.81" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.286" x2="-2.54" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="-2.8448" y1="1.9812" x2="-2.2352" y2="2.286" layer="21"/>
<rectangle x1="-2.6924" y1="-1.905" x2="-2.3876" y2="-0.508" layer="21"/>
<wire x1="-1.27" y1="1.7272" x2="-1.016" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.9812" x2="1.016" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.9812" x2="1.27" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.7272" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.254" x2="1.016" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.508" x2="-1.016" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.508" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0" y1="2.286" x2="0" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="-0.3048" y1="1.9812" x2="0.3048" y2="2.286" layer="21"/>
<rectangle x1="-0.1524" y1="-1.905" x2="0.1524" y2="-0.508" layer="21"/>
<wire x1="1.27" y1="1.7272" x2="1.524" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="1.524" y1="1.9812" x2="3.556" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="3.556" y1="1.9812" x2="3.81" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.7272" x2="3.81" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.254" x2="3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-0.508" x2="1.524" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.508" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.54" y1="2.286" x2="2.54" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="2.2352" y1="1.9812" x2="2.8448" y2="2.286" layer="21"/>
<rectangle x1="2.3876" y1="-1.905" x2="2.6924" y2="-0.508" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-2.54" y="-4.445"/>
<vertex x="-2.921" y="-5.08"/>
<vertex x="-2.159" y="-5.08"/>
</polygon>
<rectangle x1="-2.8448" y1="-2.8448" x2="-2.2352" y2="-2.2352" layer="51"/>
<rectangle x1="-0.3048" y1="-2.8448" x2="0.3048" y2="-2.2352" layer="51"/>
<rectangle x1="2.2352" y1="-2.8448" x2="2.8448" y2="-2.2352" layer="51"/>
</package>
<package name="HEAD1X3I">
<description>&lt;b&gt;Header 1x3&lt;/b&gt;</description>
<text x="-0.635" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1" shape="long" rot="R90"/>
<wire x1="-3.81" y1="-1.016" x2="-3.81" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.016" x2="-3.556" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="1.27" x2="-1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.27" x2="-1.27" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.016" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.016" x2="-1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-1.27" x2="-3.556" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-1.27" x2="-3.81" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.016" x2="-1.016" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.27" x2="1.016" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.27" x2="1.27" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.016" x2="1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.016" x2="1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-1.27" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.27" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.016" x2="1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.524" y1="1.27" x2="3.556" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.556" y1="1.27" x2="3.81" y2="1.016" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.016" x2="3.81" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.016" x2="3.556" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-1.27" x2="1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-1.27" x2="1.27" y2="-1.016" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="51">
<vertex x="-2.54" y="-1.905"/>
<vertex x="-2.921" y="-2.54"/>
<vertex x="-2.159" y="-2.54"/>
</polygon>
<rectangle x1="-2.8448" y1="-0.3048" x2="-2.2352" y2="0.3048" layer="51"/>
<rectangle x1="-0.3048" y1="-0.3048" x2="0.3048" y2="0.3048" layer="51"/>
<rectangle x1="2.2352" y1="-0.3048" x2="2.8448" y2="0.3048" layer="51"/>
</package>
<package name="HEAD1X3IA">
<description>&lt;b&gt;Header 1x3/90°&lt;/b&gt;</description>
<text x="-2.54" y="-5.715" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="-2.54" drill="1" shape="long" rot="R90"/>
<pad name="2" x="0" y="-2.54" drill="1" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-2.54" drill="1" shape="long" rot="R90"/>
<wire x1="-3.81" y1="-0.254" x2="-3.81" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.7272" x2="-3.556" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="1.9812" x2="-1.524" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.9812" x2="-1.27" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.7272" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.254" x2="-1.524" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.508" x2="-3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-0.508" x2="-3.81" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.286" x2="-2.54" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="-2.8448" y1="1.9812" x2="-2.2352" y2="2.286" layer="21"/>
<rectangle x1="-2.6924" y1="-1.905" x2="-2.3876" y2="-0.508" layer="21"/>
<wire x1="-1.27" y1="1.7272" x2="-1.016" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.9812" x2="1.016" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.9812" x2="1.27" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.7272" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.254" x2="1.016" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.508" x2="-1.016" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.508" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0" y1="2.286" x2="0" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="-0.3048" y1="1.9812" x2="0.3048" y2="2.286" layer="21"/>
<rectangle x1="-0.1524" y1="-1.905" x2="0.1524" y2="-0.508" layer="21"/>
<wire x1="1.27" y1="1.7272" x2="1.524" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="1.524" y1="1.9812" x2="3.556" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="3.556" y1="1.9812" x2="3.81" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.7272" x2="3.81" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.254" x2="3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-0.508" x2="1.524" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.508" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.54" y1="2.286" x2="2.54" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="2.2352" y1="1.9812" x2="2.8448" y2="2.286" layer="21"/>
<rectangle x1="2.3876" y1="-1.905" x2="2.6924" y2="-0.508" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-2.54" y="-4.445"/>
<vertex x="-2.921" y="-5.08"/>
<vertex x="-2.159" y="-5.08"/>
</polygon>
<rectangle x1="-2.8448" y1="-2.8448" x2="-2.2352" y2="-2.2352" layer="51"/>
<rectangle x1="-0.3048" y1="-2.8448" x2="0.3048" y2="-2.2352" layer="51"/>
<rectangle x1="2.2352" y1="-2.8448" x2="2.8448" y2="-2.2352" layer="51"/>
</package>
<package name="ARK120/3">
<description>&lt;b&gt;Svorkovnice&lt;/b&gt; 5.08mm</description>
<text x="-3.81" y="4.445" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-7.62" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.4" shape="square"/>
<pad name="2" x="0" y="0" drill="1.4" shape="octagon"/>
<pad name="3" x="5.08" y="0" drill="1.4" shape="octagon"/>
<wire x1="-7.62" y1="3.9624" x2="7.62" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="7.62" y1="3.9624" x2="7.62" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.2352" x2="7.62" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.3876" x2="7.62" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-3.6576" x2="7.62" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-3.6576" x2="-7.62" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.3876" x2="-7.62" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.2352" x2="-7.62" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.2352" x2="7.62" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.3876" x2="8.3312" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="8.3312" y1="-2.3876" x2="8.3312" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="8.3312" y1="-3.6576" x2="7.62" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.3876" x2="-6.9088" y2="-2.3876" width="0" layer="21"/>
<wire x1="-6.9088" y1="-2.3876" x2="-6.9088" y2="-3.6576" width="0" layer="21"/>
<wire x1="-6.9088" y1="-3.6576" x2="-7.62" y2="-3.6576" width="0" layer="21"/>
<circle x="-5.08" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="-5.08" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="-6.7323" y1="-1.2213" x2="-3.8587" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="-6.3013" y1="-1.6523" x2="-3.4277" y2="1.2213" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="0" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="1.6523" y1="-1.2213" x2="-1.2213" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="1.2213" y1="-1.6523" x2="-1.6523" y2="1.2213" width="0.1524" layer="21"/>
<circle x="5.08" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="5.08" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="3.8587" y1="-1.6523" x2="6.7323" y2="1.2213" width="0.1524" layer="21"/>
<wire x1="3.4277" y1="-1.2213" x2="6.3013" y2="1.6523" width="0.1524" layer="21"/>
</package>
<package name="ARK120/3I">
<description>&lt;b&gt;Svorkovnice&lt;/b&gt; 5.08mm</description>
<text x="-3.81" y="4.445" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-7.62" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.4" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.4" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.4" shape="long" rot="R90"/>
<wire x1="-7.62" y1="3.9624" x2="7.62" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="7.62" y1="3.9624" x2="7.62" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.2352" x2="7.62" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.3876" x2="7.62" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-3.6576" x2="7.62" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-3.6576" x2="-7.62" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.3876" x2="-7.62" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.2352" x2="-7.62" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.2352" x2="7.62" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.3876" x2="8.3312" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="8.3312" y1="-2.3876" x2="8.3312" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="8.3312" y1="-3.6576" x2="7.62" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.3876" x2="-6.9088" y2="-2.3876" width="0" layer="21"/>
<wire x1="-6.9088" y1="-2.3876" x2="-6.9088" y2="-3.6576" width="0" layer="21"/>
<wire x1="-6.9088" y1="-3.6576" x2="-7.62" y2="-3.6576" width="0" layer="21"/>
<circle x="-5.08" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="-5.08" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="-6.7323" y1="-1.2213" x2="-3.8587" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="-6.3013" y1="-1.6523" x2="-3.4277" y2="1.2213" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="0" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="1.6523" y1="-1.2213" x2="-1.2213" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="1.2213" y1="-1.6523" x2="-1.6523" y2="1.2213" width="0.1524" layer="21"/>
<circle x="5.08" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="5.08" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="3.8587" y1="-1.6523" x2="6.7323" y2="1.2213" width="0.1524" layer="21"/>
<wire x1="3.4277" y1="-1.2213" x2="6.3013" y2="1.6523" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-5.08" y="2.54"/>
<vertex x="-5.461" y="3.175"/>
<vertex x="-4.699" y="3.175"/>
</polygon>
</package>
<package name="CPM3">
<description>&lt;b&gt;Svorkovnice&lt;/b&gt; 5.08mm</description>
<text x="-4.445" y="10.795" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-4.445" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-5.08" y="0" drill="1.4" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.4" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.4" shape="long" rot="R90"/>
<wire x1="-8.2296" y1="10.0076" x2="-6.0198" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-6.0198" y1="10.0076" x2="-4.1402" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-4.1402" y1="10.0076" x2="-0.9398" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="10.0076" x2="0.9398" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="10.0076" x2="4.1402" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="4.1402" y1="10.0076" x2="6.0198" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="6.0198" y1="10.0076" x2="8.2296" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="8.2296" y1="10.0076" x2="8.2296" y2="7.112" width="0.1524" layer="21"/>
<wire x1="8.2296" y1="7.112" x2="8.2296" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="8.2296" y1="-1.9812" x2="-8.2296" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="-8.2296" y1="-1.9812" x2="-8.2296" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-8.2296" y1="7.112" x2="-8.2296" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-8.2296" y1="7.112" x2="8.2296" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-6.0198" y1="10.0076" x2="-6.0198" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="-6.0198" y1="8.7884" x2="-4.1402" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="-4.1402" y1="8.7884" x2="-4.1402" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="10.0076" x2="-0.9398" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="-0.9398" y1="8.7884" x2="0.9398" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="0.9398" y1="8.7884" x2="0.9398" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="4.1402" y1="10.0076" x2="4.1402" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="4.1402" y1="8.7884" x2="6.0198" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="6.0198" y1="8.7884" x2="6.0198" y2="10.0076" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-5.08" y="2.54"/>
<vertex x="-5.461" y="3.175"/>
<vertex x="-4.699" y="3.175"/>
</polygon>
</package>
<package name="PSH02-03">
<description>&lt;b&gt;Konektor se zamkem 3 piny primy&lt;/b&gt;</description>
<text x="-1.27" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="square" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.2" shape="octagon" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.2" shape="octagon" rot="R90"/>
<wire x1="-3.81" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.54" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="2.54" x2="3.81" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="2.54" x2="3.81" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-3.2512" x2="-3.81" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.2512" x2="-3.81" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.5875" x2="2.54" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.5875" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
</package>
<package name="PSH02-03I">
<description>&lt;b&gt;Konektor se zamkem 3 piny primy&lt;/b&gt;</description>
<text x="-1.27" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.2" shape="long" rot="R90"/>
<wire x1="-3.81" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.54" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="2.54" x2="3.81" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="2.54" x2="3.81" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-3.2512" x2="-3.81" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.2512" x2="-3.81" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.5875" x2="2.54" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.5875" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
</package>
<package name="PSH02-03A">
<description>&lt;b&gt;Konektor se zamkem 3 piny zahnuty&lt;/b&gt;</description>
<text x="-1.27" y="-2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="square" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.2" shape="octagon" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.2" shape="octagon" rot="R90"/>
<wire x1="-3.81" y1="4.7752" x2="3.81" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="3.81" y1="4.7752" x2="3.81" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.4732" x2="-3.81" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.4732" x2="-3.81" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="12.6238" x2="2.54" y2="12.6238" width="0.1016" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="-2.8702" y1="4.8262" x2="-2.2098" y2="5.08" layer="21"/>
<rectangle x1="-2.8702" y1="1.27" x2="-2.2098" y2="1.524" layer="21"/>
<wire x1="0" y1="5.08" x2="0" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="-0.3302" y1="4.826" x2="0.3302" y2="5.08" layer="21"/>
<rectangle x1="-0.3302" y1="1.27" x2="0.3302" y2="1.524" layer="21"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="2.2098" y1="4.826" x2="2.8702" y2="5.08" layer="21"/>
<rectangle x1="2.2098" y1="1.27" x2="2.8702" y2="1.524" layer="21"/>
</package>
<package name="PSH02-03AI">
<description>&lt;b&gt;Konektor se zamkem 3 piny zahnuty&lt;/b&gt;</description>
<text x="-1.27" y="-3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.2" shape="long" rot="R90"/>
<wire x1="-3.81" y1="4.7752" x2="3.81" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="3.81" y1="4.7752" x2="3.81" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.4732" x2="-3.81" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.4732" x2="-3.81" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="12.6238" x2="2.54" y2="12.6238" width="0.1016" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="-2.8702" y1="4.8262" x2="-2.2098" y2="5.08" layer="21"/>
<rectangle x1="-2.8702" y1="1.27" x2="-2.2098" y2="1.524" layer="21"/>
<wire x1="0" y1="5.08" x2="0" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="-0.3302" y1="4.826" x2="0.3302" y2="5.08" layer="21"/>
<rectangle x1="-0.3302" y1="1.27" x2="0.3302" y2="1.524" layer="21"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="2.2098" y1="4.826" x2="2.8702" y2="5.08" layer="21"/>
<rectangle x1="2.2098" y1="1.27" x2="2.8702" y2="1.524" layer="21"/>
</package>
<package name="HEAD1X2">
<description>&lt;b&gt;Header 1x2&lt;/b&gt;</description>
<text x="-0.635" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1" shape="square" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1" shape="octagon" rot="R90"/>
<wire x1="-2.54" y1="-1.016" x2="-2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="-2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-0.254" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.27" x2="0" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0" y1="1.016" x2="0" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.016" x2="-0.254" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-1.27" x2="-2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.27" x2="-2.54" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="0" y1="1.016" x2="0.254" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.27" x2="2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.27" x2="2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.016" x2="2.54" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.016" x2="2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.27" x2="0.254" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-1.27" x2="0" y2="-1.016" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="51">
<vertex x="-1.27" y="-1.905"/>
<vertex x="-1.651" y="-2.54"/>
<vertex x="-0.889" y="-2.54"/>
</polygon>
<rectangle x1="-1.5748" y1="-0.3048" x2="-0.9652" y2="0.3048" layer="51"/>
<rectangle x1="0.9652" y1="-0.3048" x2="1.5748" y2="0.3048" layer="51"/>
</package>
<package name="HEAD1X2A">
<description>&lt;b&gt;Header 1x2/90°&lt;/b&gt;</description>
<text x="-2.54" y="-5.715" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="-2.54" drill="1" shape="square" rot="R90"/>
<pad name="2" x="1.27" y="-2.54" drill="1" shape="octagon" rot="R90"/>
<wire x1="-2.54" y1="-0.254" x2="-2.54" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.7272" x2="-2.286" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.9812" x2="-0.254" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.9812" x2="0" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="0" y1="1.7272" x2="0" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.254" x2="-0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.508" x2="-2.286" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-0.508" x2="-2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.27" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="-1.5748" y1="1.9812" x2="-0.9652" y2="2.286" layer="21"/>
<rectangle x1="-1.4224" y1="-1.905" x2="-1.1176" y2="-0.508" layer="21"/>
<wire x1="0" y1="1.7272" x2="0.254" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.9812" x2="2.286" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.9812" x2="2.54" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.7272" x2="2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.254" x2="2.286" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-0.508" x2="0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.508" x2="0" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.27" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="0.9652" y1="1.9812" x2="1.5748" y2="2.286" layer="21"/>
<rectangle x1="1.1176" y1="-1.905" x2="1.4224" y2="-0.508" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-1.27" y="-4.445"/>
<vertex x="-1.651" y="-5.08"/>
<vertex x="-0.889" y="-5.08"/>
</polygon>
<rectangle x1="-1.5748" y1="-2.8448" x2="-0.9652" y2="-2.2352" layer="51"/>
<rectangle x1="0.9652" y1="-2.8448" x2="1.5748" y2="-2.2352" layer="51"/>
</package>
<package name="HEAD1X2I">
<description>&lt;b&gt;Header 1x2&lt;/b&gt;</description>
<text x="-0.635" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<wire x1="-2.54" y1="-1.016" x2="-2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="-2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-0.254" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.27" x2="0" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0" y1="1.016" x2="0" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.016" x2="-0.254" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-1.27" x2="-2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.27" x2="-2.54" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="0" y1="1.016" x2="0.254" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.27" x2="2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.27" x2="2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.016" x2="2.54" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.016" x2="2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.27" x2="0.254" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-1.27" x2="0" y2="-1.016" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="51">
<vertex x="-1.27" y="-1.905"/>
<vertex x="-1.651" y="-2.54"/>
<vertex x="-0.889" y="-2.54"/>
</polygon>
<rectangle x1="-1.5748" y1="-0.3048" x2="-0.9652" y2="0.3048" layer="51"/>
<rectangle x1="0.9652" y1="-0.3048" x2="1.5748" y2="0.3048" layer="51"/>
</package>
<package name="HEAD1X2IA">
<description>&lt;b&gt;Header 1x2/90°&lt;/b&gt;</description>
<text x="-2.54" y="-5.715" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="-2.54" drill="1" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-2.54" drill="1" shape="long" rot="R90"/>
<wire x1="-2.54" y1="-0.254" x2="-2.54" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.7272" x2="-2.286" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.9812" x2="-0.254" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.9812" x2="0" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="0" y1="1.7272" x2="0" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.254" x2="-0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.508" x2="-2.286" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-0.508" x2="-2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.27" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="-1.5748" y1="1.9812" x2="-0.9652" y2="2.286" layer="21"/>
<rectangle x1="-1.4224" y1="-1.905" x2="-1.1176" y2="-0.508" layer="21"/>
<wire x1="0" y1="1.7272" x2="0.254" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.9812" x2="2.286" y2="1.9812" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.9812" x2="2.54" y2="1.7272" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.7272" x2="2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.254" x2="2.286" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-0.508" x2="0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.508" x2="0" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.27" y2="7.366" width="0.6096" layer="21"/>
<rectangle x1="0.9652" y1="1.9812" x2="1.5748" y2="2.286" layer="21"/>
<rectangle x1="1.1176" y1="-1.905" x2="1.4224" y2="-0.508" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-1.27" y="-4.445"/>
<vertex x="-1.651" y="-5.08"/>
<vertex x="-0.889" y="-5.08"/>
</polygon>
<rectangle x1="-1.5748" y1="-2.8448" x2="-0.9652" y2="-2.2352" layer="51"/>
<rectangle x1="0.9652" y1="-2.8448" x2="1.5748" y2="-2.2352" layer="51"/>
</package>
<package name="ARK120/2">
<description>&lt;b&gt;Svorkovnice&lt;/b&gt; 5.08mm</description>
<text x="-3.81" y="4.445" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-7.62" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.4" shape="square"/>
<pad name="2" x="2.54" y="0" drill="1.4" shape="octagon"/>
<wire x1="-5.08" y1="3.9624" x2="5.08" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.9624" x2="5.08" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.2352" x2="5.08" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.3876" x2="5.08" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.6576" x2="5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-3.6576" x2="-5.08" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.3876" x2="-5.08" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.2352" x2="-5.08" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.2352" x2="5.08" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.3876" x2="5.7912" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="5.7912" y1="-2.3876" x2="5.7912" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="5.7912" y1="-3.6576" x2="5.08" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.3876" x2="-4.3688" y2="-2.3876" width="0" layer="21"/>
<wire x1="-4.3688" y1="-2.3876" x2="-4.3688" y2="-3.6576" width="0" layer="21"/>
<wire x1="-4.3688" y1="-3.6576" x2="-5.08" y2="-3.6576" width="0" layer="21"/>
<circle x="-2.54" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="-2.54" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="-4.1923" y1="-1.2213" x2="-1.3187" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="-3.7613" y1="-1.6523" x2="-0.8877" y2="1.2213" width="0.1524" layer="21"/>
<circle x="2.54" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="2.54" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="4.1923" y1="-1.2213" x2="1.3187" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="3.7613" y1="-1.6523" x2="0.8877" y2="1.2213" width="0.1524" layer="21"/>
</package>
<package name="ARK120/2I">
<description>&lt;b&gt;Svorkovnice&lt;/b&gt; 5.08mm</description>
<text x="-3.81" y="4.445" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-7.62" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.4" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.4" shape="long" rot="R90"/>
<wire x1="-5.08" y1="3.9624" x2="5.08" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.9624" x2="5.08" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.2352" x2="5.08" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.3876" x2="5.08" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.6576" x2="5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-3.6576" x2="-5.08" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.3876" x2="-5.08" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.2352" x2="-5.08" y2="3.9624" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.2352" x2="5.08" y2="2.2352" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.3876" x2="5.7912" y2="-2.3876" width="0.1524" layer="21"/>
<wire x1="5.7912" y1="-2.3876" x2="5.7912" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="5.7912" y1="-3.6576" x2="5.08" y2="-3.6576" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.3876" x2="-4.3688" y2="-2.3876" width="0" layer="21"/>
<wire x1="-4.3688" y1="-2.3876" x2="-4.3688" y2="-3.6576" width="0" layer="21"/>
<wire x1="-4.3688" y1="-3.6576" x2="-5.08" y2="-3.6576" width="0" layer="21"/>
<circle x="-2.54" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="-2.54" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="-4.1923" y1="-1.2213" x2="-1.3187" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="-3.7613" y1="-1.6523" x2="-0.8877" y2="1.2213" width="0.1524" layer="21"/>
<circle x="2.54" y="0" radius="2.1336" width="0.1524" layer="21"/>
<circle x="2.54" y="-3.302" radius="1.016" width="0.1524" layer="21"/>
<wire x1="4.1923" y1="-1.2213" x2="1.3187" y2="1.6523" width="0.1524" layer="21"/>
<wire x1="3.7613" y1="-1.6523" x2="0.8877" y2="1.2213" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-2.54" y="2.54"/>
<vertex x="-2.921" y="3.175"/>
<vertex x="-2.159" y="3.175"/>
</polygon>
</package>
<package name="CPM2">
<description>&lt;b&gt;Svorkovnice&lt;/b&gt; 5.08mm</description>
<text x="-4.445" y="10.795" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-4.445" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.54" y="0" drill="1.4" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.4" shape="long" rot="R90"/>
<wire x1="-5.6896" y1="10.0076" x2="-3.4798" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-3.4798" y1="10.0076" x2="-1.6002" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-1.6002" y1="10.0076" x2="1.6002" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="10.0076" x2="3.4798" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="3.4798" y1="10.0076" x2="5.6896" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="5.6896" y1="10.0076" x2="5.6896" y2="7.112" width="0.1524" layer="21"/>
<wire x1="5.6896" y1="7.112" x2="5.6896" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="5.6896" y1="-1.9812" x2="-5.6896" y2="-1.9812" width="0.1524" layer="21"/>
<wire x1="-5.6896" y1="-1.9812" x2="-5.6896" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-5.6896" y1="7.112" x2="-5.6896" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="-5.6896" y1="7.112" x2="5.6896" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-3.4798" y1="10.0076" x2="-3.4798" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="-3.4798" y1="8.7884" x2="-1.6002" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="-1.6002" y1="8.7884" x2="-1.6002" y2="10.0076" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="10.0076" x2="1.6002" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="1.6002" y1="8.7884" x2="3.4798" y2="8.7884" width="0.1524" layer="21"/>
<wire x1="3.4798" y1="8.7884" x2="3.4798" y2="10.0076" width="0.1524" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="-2.54" y="2.54"/>
<vertex x="-2.921" y="3.175"/>
<vertex x="-2.159" y="3.175"/>
</polygon>
</package>
<package name="PSH02-02">
<description>&lt;b&gt;Konektor se zamkem 2 piny primy&lt;/b&gt;</description>
<text x="-1.27" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1.2" shape="square" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.2" shape="octagon" rot="R90"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-3.2512" x2="-2.54" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.2512" x2="-2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.5875" x2="1.27" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.5875" x2="1.27" y2="2.54" width="0.1524" layer="21"/>
</package>
<package name="PSH02-02I">
<description>&lt;b&gt;Konektor se zamkem 2 piny primy&lt;/b&gt;</description>
<text x="-1.27" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.2" shape="long" rot="R90"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-3.2512" x2="-2.54" y2="-3.2512" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.2512" x2="-2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.5875" x2="1.27" y2="1.5875" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.5875" x2="1.27" y2="2.54" width="0.1524" layer="21"/>
</package>
<package name="PSH02-02A">
<description>&lt;b&gt;Konektor se zamkem 2 piny zahnuty&lt;/b&gt;</description>
<text x="-1.27" y="-2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1.2" shape="square" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.2" shape="octagon" rot="R90"/>
<wire x1="-2.54" y1="4.7752" x2="2.54" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="2.54" y1="4.7752" x2="2.54" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.4732" x2="-2.54" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.4732" x2="-2.54" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="12.6238" x2="1.27" y2="12.6238" width="0.1016" layer="21"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="-1.6002" y1="4.8262" x2="-0.9398" y2="5.08" layer="21"/>
<rectangle x1="-1.6002" y1="1.27" x2="-0.9398" y2="1.524" layer="21"/>
<wire x1="1.27" y1="5.08" x2="1.27" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="0.9398" y1="4.826" x2="1.6002" y2="5.08" layer="21"/>
<rectangle x1="0.9398" y1="1.27" x2="1.6002" y2="1.524" layer="21"/>
</package>
<package name="PSH02-02AI">
<description>&lt;b&gt;Konektor se zamkem 2 piny zahnuty&lt;/b&gt;</description>
<text x="-1.27" y="-3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-1.27" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.2" shape="long" rot="R90"/>
<wire x1="-2.54" y1="4.7752" x2="2.54" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="2.54" y1="4.7752" x2="2.54" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.4732" x2="-2.54" y2="1.4732" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.4732" x2="-2.54" y2="4.7752" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="12.6238" x2="1.27" y2="12.6238" width="0.1016" layer="21"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="-1.6002" y1="4.8262" x2="-0.9398" y2="5.08" layer="21"/>
<rectangle x1="-1.6002" y1="1.27" x2="-0.9398" y2="1.524" layer="21"/>
<wire x1="1.27" y1="5.08" x2="1.27" y2="12.5476" width="0.6604" layer="21"/>
<rectangle x1="0.9398" y1="4.826" x2="1.6002" y2="5.08" layer="21"/>
<rectangle x1="0.9398" y1="1.27" x2="1.6002" y2="1.524" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="CON1X3">
<pin name="1" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<text x="0" y="4.445" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-5.715" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="CON1X2">
<pin name="1" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<text x="0" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-5.715" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CON1X3" prefix="J" uservalue="yes">
<description>&lt;b&gt;Konektor 3 piny&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="CON1X3" x="0" y="0"/>
</gates>
<devices>
<device name="HEAD1X3" package="HEAD1X3">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HEAD1X3A" package="HEAD1X3A">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HEAD1X3I" package="HEAD1X3I">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HEAD1X3IA" package="HEAD1X3IA">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ARK120/3" package="ARK120/3">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ARK120/3I" package="ARK120/3I">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CPM3" package="CPM3">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02" package="PSH02-03">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02I" package="PSH02-03I">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02A" package="PSH02-03A">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02AI" package="PSH02-03AI">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON1X2" prefix="J" uservalue="yes">
<description>&lt;b&gt;Konektor 2 piny&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="CON1X2" x="0" y="0"/>
</gates>
<devices>
<device name="HEAD1X2" package="HEAD1X2">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HEAD1X2A" package="HEAD1X2A">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HEAD1X2I" package="HEAD1X2I">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HEAD1X2IA" package="HEAD1X2IA">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ARK120/2" package="ARK120/2">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ARK120/2I" package="ARK120/2I">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CPM2" package="CPM2">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02" package="PSH02-02">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02I" package="PSH02-02I">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02A" package="PSH02-02A">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PSH02AI" package="PSH02-02AI">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="transistor-small-signal">
<description>&lt;b&gt;Small Signal Transistors&lt;/b&gt;&lt;p&gt;
Packages from :&lt;br&gt;
www.infineon.com; &lt;br&gt;
www.semiconductors.com;&lt;br&gt;
www.irf.com&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SOT23">
<description>&lt;b&gt;SOT-23&lt;/b&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="P-MOS">
<wire x1="0" y1="0" x2="-1.016" y2="0.381" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0.381" x2="-1.016" y2="-0.381" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="-0.381" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="2.794" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.381" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-3.048" x2="1.27" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-3.048" x2="1.27" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-0.254" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="2.794" width="0.1524" layer="94"/>
<wire x1="1.27" y1="2.794" x2="0" y2="2.794" width="0.1524" layer="94"/>
<wire x1="0.762" y1="-0.762" x2="1.778" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-0.762" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="0.762" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0" x2="1.778" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="-2.032" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="2.032" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="0" x2="-0.889" y2="-0.127" width="0.254" layer="94"/>
<wire x1="-0.889" y1="-0.127" x2="-0.889" y2="0.127" width="0.254" layer="94"/>
<wire x1="-0.889" y1="0.127" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="1.016" y1="-0.635" x2="1.524" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.524" y1="-0.635" x2="1.27" y2="-0.254" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.254" x2="1.016" y2="-0.635" width="0.254" layer="94"/>
<circle x="0" y="2.794" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="2.032" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="-3.048" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.54" x2="-1.524" y2="-1.27" layer="94"/>
<rectangle x1="-2.032" y1="1.27" x2="-1.524" y2="2.54" layer="94"/>
<rectangle x1="-2.032" y1="-0.762" x2="-1.524" y2="0.762" layer="94"/>
<pin name="G" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="D" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BSS84" prefix="Q">
<description>&lt;b&gt;P-CHANNEL MOS FET&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="P-MOS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="Vladicek" deviceset="STM32L031F*P" device="" technology="4"/>
<part name="G1" library="Vladicek" deviceset="CR2032H" device=""/>
<part name="IC2" library="Vladicek" deviceset="MCP9700" device=""/>
<part name="R6" library="rcl" deviceset="R-EU_" device="R0805" value="560"/>
<part name="VSS" library="supply1" deviceset="GND" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="Q1" library="Vladicek" deviceset="CRYSTAL" device="TC38H-SMD" value="32768"/>
<part name="C1" library="cdrt" deviceset="C" device="0805" value="12,5p"/>
<part name="C2" library="cdrt" deviceset="C" device="0805" value="12,5p"/>
<part name="C3" library="cdrt" deviceset="C" device="0805" value="100n"/>
<part name="C4" library="cdrt" deviceset="C" device="0805" value="10M"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="J1" library="conect" deviceset="CON1X3" device="HEAD1X3I" value="SWD"/>
<part name="J2" library="conect" deviceset="CON1X3" device="HEAD1X3I" value="COM"/>
<part name="J3" library="conect" deviceset="CON1X2" device="HEAD1X2I" value="RST"/>
<part name="C5" library="cdrt" deviceset="C" device="0805" value="100n"/>
<part name="U$1" library="Vladicek" deviceset="GD25" device="SO08" value="GD25"/>
<part name="VDD1" library="supply1" deviceset="VDD" device=""/>
<part name="VSS1" library="supply1" deviceset="VSS" device=""/>
<part name="Q2" library="transistor-small-signal" deviceset="BSS84" device=""/>
<part name="R1" library="rcl" deviceset="R-EU_" device="R0805" value="47k"/>
<part name="VDD2" library="supply1" deviceset="VDD" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="MCU" x="66.04" y="50.8" smashed="yes">
<attribute name="NAME" x="60.96" y="73.66" size="1.778" layer="95"/>
<attribute name="VALUE" x="60.96" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="G1" gate="1" x="15.24" y="50.8" rot="R90"/>
<instance part="IC2" gate="G$1" x="99.06" y="25.4" rot="MR0"/>
<instance part="R6" gate="G$1" x="33.02" y="33.02"/>
<instance part="VSS" gate="1" x="15.24" y="30.48"/>
<instance part="GND1" gate="1" x="99.06" y="71.12"/>
<instance part="GND3" gate="1" x="111.76" y="15.24"/>
<instance part="GND4" gate="1" x="99.06" y="15.24"/>
<instance part="Q1" gate="G$1" x="27.94" y="45.72" smashed="yes">
<attribute name="NAME" x="30.48" y="46.736" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.416" y="49.276" size="1.778" layer="96"/>
</instance>
<instance part="C1" gate="G$1" x="33.02" y="40.64"/>
<instance part="C2" gate="G$1" x="22.86" y="40.64"/>
<instance part="C3" gate="G$1" x="25.4" y="76.2"/>
<instance part="C4" gate="G$1" x="33.02" y="76.2"/>
<instance part="GND5" gate="1" x="40.64" y="71.12"/>
<instance part="J1" gate="1" x="96.52" y="78.74" rot="R90"/>
<instance part="J2" gate="1" x="109.22" y="58.42" rot="R90"/>
<instance part="J3" gate="1" x="40.64" y="25.4" rot="R270"/>
<instance part="C5" gate="G$1" x="116.84" y="22.86"/>
<instance part="U$1" gate="G$1" x="127" y="38.1"/>
<instance part="VDD1" gate="G$1" x="15.24" y="68.58"/>
<instance part="VSS1" gate="G$1" x="48.26" y="81.28" rot="R90"/>
<instance part="Q2" gate="G$1" x="124.46" y="71.12"/>
<instance part="R1" gate="G$1" x="119.38" y="78.74"/>
<instance part="VDD2" gate="G$1" x="132.08" y="78.74" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="99.06" y1="76.2" x2="99.06" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="J1" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="111.76" y1="17.78" x2="111.76" y2="20.32" width="0.1524" layer="91"/>
<wire x1="111.76" y1="20.32" x2="111.76" y2="35.56" width="0.1524" layer="91"/>
<wire x1="111.76" y1="35.56" x2="111.76" y2="55.88" width="0.1524" layer="91"/>
<wire x1="116.84" y1="35.56" x2="111.76" y2="35.56" width="0.1524" layer="91"/>
<junction x="111.76" y="35.56"/>
<pinref part="J2" gate="1" pin="3"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="111.76" y1="20.32" x2="116.84" y2="20.32" width="0.1524" layer="91"/>
<junction x="111.76" y="20.32"/>
<pinref part="U$1" gate="G$1" pin="VSS"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="25.4" y1="81.28" x2="33.02" y2="81.28" width="0.1524" layer="91"/>
<wire x1="33.02" y1="78.74" x2="33.02" y2="81.28" width="0.1524" layer="91"/>
<wire x1="33.02" y1="81.28" x2="38.1" y2="81.28" width="0.1524" layer="91"/>
<wire x1="38.1" y1="81.28" x2="40.64" y2="81.28" width="0.1524" layer="91"/>
<wire x1="40.64" y1="81.28" x2="40.64" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="25.4" y1="81.28" x2="25.4" y2="78.74" width="0.1524" layer="91"/>
<junction x="33.02" y="81.28"/>
<pinref part="VSS1" gate="G$1" pin="VSS"/>
<wire x1="45.72" y1="81.28" x2="40.64" y2="81.28" width="0.1524" layer="91"/>
<junction x="40.64" y="81.28"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<pinref part="VSS" gate="1" pin="GND"/>
<wire x1="27.94" y1="33.02" x2="22.86" y2="33.02" width="0.1524" layer="91"/>
<pinref part="G1" gate="1" pin="-"/>
<wire x1="22.86" y1="33.02" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
<wire x1="15.24" y1="45.72" x2="15.24" y2="38.1" width="0.1524" layer="91"/>
<junction x="15.24" y="33.02"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="15.24" y1="38.1" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="22.86" y1="38.1" x2="33.02" y2="38.1" width="0.1524" layer="91"/>
<wire x1="22.86" y1="38.1" x2="15.24" y2="38.1" width="0.1524" layer="91"/>
<junction x="22.86" y="38.1"/>
<junction x="15.24" y="38.1"/>
<wire x1="22.86" y1="27.94" x2="22.86" y2="33.02" width="0.1524" layer="91"/>
<junction x="22.86" y="33.02"/>
<pinref part="J3" gate="1" pin="2"/>
<wire x1="38.1" y1="27.94" x2="22.86" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="GND"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="IC1" gate="MCU" pin="BOOT0"/>
<wire x1="38.1" y1="33.02" x2="43.18" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="NRST"/>
<wire x1="40.64" y1="35.56" x2="43.18" y2="35.56" width="0.1524" layer="91"/>
<pinref part="J3" gate="1" pin="1"/>
<wire x1="40.64" y1="35.56" x2="40.64" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA14"/>
<wire x1="88.9" y1="60.96" x2="96.52" y2="60.96" width="0.1524" layer="91"/>
<wire x1="96.52" y1="76.2" x2="96.52" y2="60.96" width="0.1524" layer="91"/>
<pinref part="J1" gate="1" pin="2"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="93.98" y1="76.2" x2="93.98" y2="58.42" width="0.1524" layer="91"/>
<pinref part="IC1" gate="MCU" pin="PA13"/>
<wire x1="93.98" y1="58.42" x2="88.9" y2="58.42" width="0.1524" layer="91"/>
<pinref part="J1" gate="1" pin="1"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA5"/>
<wire x1="88.9" y1="45.72" x2="109.22" y2="45.72" width="0.1524" layer="91"/>
<wire x1="109.22" y1="45.72" x2="109.22" y2="50.8" width="0.1524" layer="91"/>
<wire x1="109.22" y1="50.8" x2="139.7" y2="50.8" width="0.1524" layer="91"/>
<wire x1="139.7" y1="50.8" x2="139.7" y2="38.1" width="0.1524" layer="91"/>
<wire x1="139.7" y1="38.1" x2="137.16" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="SCLK"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA7"/>
<wire x1="88.9" y1="50.8" x2="106.68" y2="50.8" width="0.1524" layer="91"/>
<wire x1="106.68" y1="50.8" x2="106.68" y2="30.48" width="0.1524" layer="91"/>
<wire x1="106.68" y1="30.48" x2="139.7" y2="30.48" width="0.1524" layer="91"/>
<wire x1="139.7" y1="30.48" x2="139.7" y2="35.56" width="0.1524" layer="91"/>
<wire x1="139.7" y1="35.56" x2="137.16" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="SI"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="116.84" y1="40.64" x2="104.14" y2="40.64" width="0.1524" layer="91"/>
<wire x1="104.14" y1="40.64" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<pinref part="IC1" gate="MCU" pin="PA6"/>
<wire x1="104.14" y1="48.26" x2="88.9" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="SO"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA4"/>
<wire x1="88.9" y1="43.18" x2="116.84" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="CS"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="OSC32_IN"/>
<wire x1="43.18" y1="48.26" x2="22.86" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="22.86" y1="48.26" x2="22.86" y2="45.72" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<wire x1="22.86" y1="45.72" x2="22.86" y2="43.18" width="0.1524" layer="91"/>
<wire x1="22.86" y1="45.72" x2="25.4" y2="45.72" width="0.1524" layer="91"/>
<junction x="22.86" y="45.72"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="33.02" y1="45.72" x2="33.02" y2="43.18" width="0.1524" layer="91"/>
<pinref part="IC1" gate="MCU" pin="OSC32_OUT"/>
<wire x1="33.02" y1="45.72" x2="43.18" y2="45.72" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<wire x1="33.02" y1="45.72" x2="30.48" y2="45.72" width="0.1524" layer="91"/>
<junction x="33.02" y="45.72"/>
</segment>
</net>
<net name="VDD" class="0">
<segment>
<pinref part="G1" gate="1" pin="+"/>
<wire x1="15.24" y1="66.04" x2="15.24" y2="60.96" width="0.1524" layer="91"/>
<pinref part="VDD1" gate="G$1" pin="VDD"/>
<pinref part="IC1" gate="MCU" pin="VDDA"/>
<wire x1="15.24" y1="60.96" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
<wire x1="38.1" y1="60.96" x2="38.1" y2="40.64" width="0.1524" layer="91"/>
<wire x1="38.1" y1="40.64" x2="43.18" y2="40.64" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="33.02" y1="73.66" x2="30.48" y2="73.66" width="0.1524" layer="91"/>
<wire x1="30.48" y1="73.66" x2="25.4" y2="73.66" width="0.1524" layer="91"/>
<wire x1="30.48" y1="73.66" x2="30.48" y2="60.96" width="0.1524" layer="91"/>
<junction x="30.48" y="73.66"/>
<wire x1="30.48" y1="60.96" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<wire x1="15.24" y1="60.96" x2="30.48" y2="60.96" width="0.1524" layer="91"/>
<junction x="15.24" y="60.96"/>
<junction x="30.48" y="60.96"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="Q2" gate="G$1" pin="S"/>
<wire x1="124.46" y1="78.74" x2="124.46" y2="76.2" width="0.1524" layer="91"/>
<wire x1="124.46" y1="78.74" x2="129.54" y2="78.74" width="0.1524" layer="91"/>
<junction x="124.46" y="78.74"/>
<pinref part="VDD2" gate="G$1" pin="VDD"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA10"/>
<pinref part="J2" gate="1" pin="1"/>
<wire x1="88.9" y1="55.88" x2="106.68" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA9"/>
<pinref part="J2" gate="1" pin="2"/>
<wire x1="88.9" y1="53.34" x2="109.22" y2="53.34" width="0.1524" layer="91"/>
<wire x1="109.22" y1="53.34" x2="109.22" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="D"/>
<wire x1="109.22" y1="38.1" x2="114.3" y2="38.1" width="0.1524" layer="91"/>
<wire x1="114.3" y1="38.1" x2="116.84" y2="38.1" width="0.1524" layer="91"/>
<wire x1="114.3" y1="38.1" x2="114.3" y2="48.26" width="0.1524" layer="91"/>
<junction x="114.3" y="38.1"/>
<wire x1="114.3" y1="48.26" x2="124.46" y2="48.26" width="0.1524" layer="91"/>
<wire x1="124.46" y1="48.26" x2="137.16" y2="48.26" width="0.1524" layer="91"/>
<wire x1="137.16" y1="48.26" x2="137.16" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="116.84" y1="25.4" x2="114.3" y2="25.4" width="0.1524" layer="91"/>
<wire x1="114.3" y1="25.4" x2="114.3" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="WP"/>
<pinref part="U$1" gate="G$1" pin="VCC"/>
<pinref part="IC2" gate="G$1" pin="VDD"/>
<wire x1="109.22" y1="25.4" x2="109.22" y2="38.1" width="0.1524" layer="91"/>
<wire x1="124.46" y1="66.04" x2="124.46" y2="48.26" width="0.1524" layer="91"/>
<junction x="124.46" y="48.26"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="101.6" y1="38.1" x2="101.6" y2="66.04" width="0.1524" layer="91"/>
<pinref part="IC1" gate="MCU" pin="PA2"/>
<wire x1="88.9" y1="38.1" x2="101.6" y2="38.1" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="G"/>
<wire x1="119.38" y1="73.66" x2="114.3" y2="73.66" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="114.3" y1="73.66" x2="114.3" y2="78.74" width="0.1524" layer="91"/>
<wire x1="101.6" y1="66.04" x2="114.3" y2="66.04" width="0.1524" layer="91"/>
<wire x1="114.3" y1="66.04" x2="114.3" y2="73.66" width="0.1524" layer="91"/>
<junction x="114.3" y="73.66"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="IC1" gate="MCU" pin="PA3"/>
<wire x1="88.9" y1="40.64" x2="91.44" y2="40.64" width="0.1524" layer="91"/>
<wire x1="91.44" y1="40.64" x2="91.44" y2="30.48" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="VOUT"/>
<wire x1="91.44" y1="30.48" x2="88.9" y2="30.48" width="0.1524" layer="91"/>
<wire x1="88.9" y1="30.48" x2="88.9" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
