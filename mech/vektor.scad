include <frontpanel.scad>;

thickness = 10;
width = 100;
height = 600;


module base(t, radius)
{
  minkowski() 
  {
    translate([radius,radius,0]) cube([100-radius*2,600-radius*2,t],false);
    cylinder(h=1,r=radius,false);
  }
}

module back()
{
    difference()
    {
        base(10, radius=10);
        translate([12,465,0]) cube([76,110,15]);
}   }

module speaker_opening(t, screw_mounts=true, radius=40)
{
    translate([0,0,-1]) cylinder(t+2, radius, radius, false);
    
    if (screw_mounts)
    {
        for (i = [0: 3])
        {
            rotate([0,0,45 + 90*i]) translate([0,49,-1]) cylinder(t+2, r=2, false);
        }
    }
}


module layer_front()
{
    difference()
    {
        base(10, radius=10);
        for (i = [0:2])
        {
            translate([50,100+i*150,0]) speaker_opening(t=10);
        }
    }
}

module layer_front_2()
{
    difference()
    {
        base(10, radius=10);
        for (i = [0:2]) 
        {
            translate([50,100+i*150,0]) speaker_opening(t=10, screw_mounts=false);
        }
    }
}

module layer_front_3()
{
    difference()
    {
        base(10, radius=10);
        hull()
        {
            for (i = [0:2])
            {
                translate([50,60+i*200,0]) speaker_opening(t=10, screw_mounts=false);
            }
        }
    }
}


module layer_inner()
{
    difference()
    {
        base(10, radius=10);
        translate([10,height-70,0]) cube([80,50,15]);
        hull()
        {
            for (i = [0:2])
            {
                translate([50,60+i*200,0]) speaker_opening(t=10, 
                                                           radius=35, 
                                                           screw_mounts=false);
            }
        }
    }
}


spacing = 2*thickness;

// L0 Front
layer_front();

// L1
translate([0,0,spacing])
layer_front_2();

// L2-L3
for (n = [2:3])
{
    translate([0,0,n*spacing])
    layer_front_3();
}


// L4-L17
for (n = [4:17])
{
    translate([0,0,n*spacing])
    layer_inner();
}

for (n = [18:20])
{
    translate([0,0,n*spacing])
    back();

}

n = 21;

/*translate([95,590,n*spacing+2.5])
rotate([0,180,90])
panel(assembly=true);*/