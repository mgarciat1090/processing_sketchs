color[] crowds = {#678C8B, #8FA89B, #A2BAB0, #D0EDDE, #B3B597};
color[] palette = crowds;
size(600,200);
String[] presidents = loadStrings("c://AdwCleaner[S3].txt");
println(presidents);

background(palette[0]);
fill(palette[1]);
text(presidents[40],50,50);
