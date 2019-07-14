
// Import PBA
color ("green")
translate([-125,125,5])
import ("vektor.stl",convexity=3);

// Create openings for PBA
difference()
{
cube([120,80,1.5]);
// Toslink
translate([10,6,-0.25]) cube([12,16,2]);
translate([10,32,-0.25]) cube([12,16,2]);
// Debug connector
translate([24.5,16,-0.25]) cube([11,22,2]);
// Mount holes
translate([10+6,5+22,1]) cylinder(h=3, r=1.25, center=true, $fn=100);  
translate([10+21,5+7,1]) cylinder(h=3, r=1.25, center=true, $fn=100);
translate([10+21,5+37,1]) cylinder(h=3, r=1.25, center=true, $fn=100);  
translate([10+93,5+7,1]) cylinder(h=3, r=1.25, center=true, $fn=100);  
translate([10+93,5+37,1]) cylinder(h=3, r=1.25, center=true, $fn=100);
}