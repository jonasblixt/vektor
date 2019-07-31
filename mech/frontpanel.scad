
module panel(assembly=false)
{
    if (assembly)
    {
        // Import PBA
        color ("green")
        translate([-115,130,6.5])
        import ("vektor.stl",convexity=3);

        // Import connector
        color ("red")
        translate([40,70,-4])
        rotate([0,180,0])
        import ("03feef3e.stl",convexity=3);
    }



    // Create openings for PBA
    difference()
    {
    color("gray")
    cube([140,90,1.5]);
    // Toslink
    translate([20,11,-0.25]) cube([12,16,2]);
    translate([20,37,-0.25]) cube([12,16,2]);
    // Debug connector
    translate([34.5,21,-0.25]) cube([11,22,2]);
    // Mount holes
    translate([20+6,10+22,1]) cylinder(h=3, r=1.3, center=true, $fn=100);  
    translate([20+21,10+7,1]) cylinder(h=3, r=1.3, center=true, $fn=100);
    translate([20+21,10+37,1]) cylinder(h=3, r=1.3, center=true, $fn=100);  
    translate([20+93,10+7,1]) cylinder(h=3, r=1.3, center=true, $fn=100);  
    translate([20+93,10+37,1]) cylinder(h=3, r=1.3, center=true, $fn=100);
    // Frontpanel mount holes
    translate([5,10,1]) cylinder(h=2.1, r=2, center=true, $fn=100);
    translate([135,10,1]) cylinder(h=2.1, r=2, center=true, $fn=100);
    translate([135,80,1]) cylinder(h=2.1, r=2, center=true, $fn=100);
    translate([5,80,1]) cylinder(h=2.1, r=2, center=true, $fn=100);
    // Power connector
    translate([25,59,-0.25]) cube([30,22,2]);
    translate([20,70,1]) cylinder(h=3, r=2, center=true, $fn=100);  
    translate([60,70,1]) cylinder(h=3, r=2, center=true, $fn=100);  
    // Ventilation holes
    for (y = [0:6])
    {

            if ((y % 2) == 0)
                for (x = [0:2])
                {        
                    translate([75+y*5,3+61+x*6,-0.25]) cylinder(h=4, r=2, center=true, $fn=100);
                }
            else
                for (x = [0:3])
                {       
                    translate([75+y*5,61+x*6,-0.25]) cylinder(h=4, r=2, center=true, $fn=100);
                }
        
    }
    }
}

 //panel(assembly=true);
