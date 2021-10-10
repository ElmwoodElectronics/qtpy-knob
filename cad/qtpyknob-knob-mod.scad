// modify todbot's qtpyknob-knob for 15 mm encoder shaft
// scruss - 2021-03

bbox = [ 50.000000, 50.000000, 18.000000 ];
minima = [ -25.000000, -25.000000, -23.000000 ];

shaft_cutout = 7;   // encoder cut-out length

module knob() {
    translate([-bbox.x/2, -bbox.y/2, 0])translate(-minima)rotate([180,0,0])import("qtpyknob-knob.stl");
}

module dshaft_profile() {
    /*
        extract d-shaft profile so we can extend 
    */
    intersection() {
        projection(cut=true)translate([0,0,-10])knob();
        square(20, center=true);
    }
}

module dshaft_plug_profile() {
    /* shaft d = 6.5 mm, so this should plug hole */
    circle(d=7, $fn=32);
}

/*
    todbot's design has d-shaft height of 12 mm,
    giving a cutout height of 9 mm

    we need 7 mm ... kinda
*/

union() {
    // don't really need this for modern OpenSCAD
    knob();
    linear_extrude(height=1+12+(9-shaft_cutout))dshaft_profile();
    linear_extrude(height=3+12-shaft_cutout)dshaft_plug_profile();
}


