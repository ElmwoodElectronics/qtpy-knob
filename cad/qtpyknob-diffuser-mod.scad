// modify todbot's qtpyknob-diffuser for 15 mm encoder shaft
// scruss - 2021-03

bbox = [ 49.988811, 49.994404, 2.000000 ];
minima = [ -25.000000, -24.997202, 2.700000 ];

difference() {
    translate([-bbox.x/2, -bbox.y/2, 0])translate(-minima)import("qtpyknob-diffuser.stl");
    translate([0,0,0.8])cylinder(d=bbox.x/2, h=bbox.z);
}

