function p=isofon(f,spl)


%	p=isofon(f,spl)
%
%	Curvas isofónicas.
%
%	f	frecuencia en Hz.Entre 20Hz y 10Khz.
%	spl	dBspl de nivel presión sonora.Desde 0 dBspl a 120 dBspl.
%	p	nivel de sonoridad en fonios. Si p=-1, fuera de rango o 
%	nivel en fonios menor de 0.

fn=[1:27];
spln=[1:7];

fon(1,:)=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 3 6 0 -1 -1 -1 -1 -1];
fon(2,:)=[-1 -1 -1 -1 -1 -1 -1 -1 -1 10 17 20 20 20 20 20 20 20 22 27 28 24 19 13 8 6 10];
fon(3,:)=[-1 -1 -1 -1 5 15 18 21 25 37 41 42 43 43 42 41 40 40 42 46 48 44 40 35 31 30 34];
fon(4,:)=[-1 0 21 32 40 42 46 49 51 60 63 64 64 63 62 61 60 60 63 67 68 65 60 55 53 53 55];
fon(5,:)=[18 42 56 62 66 68 71 72 74 82 84 84 83 83 82 81 80 80 85 90 90 87 80 77 74 74 75];  
fon(6,:)=[58 75 84 88 90 92 94 95 96 102 103 103 102 102 101 101 100 100 107 112 112 109 101 98 95 94 95];
fon(7,:)=[90 101 108 110 112 114 115 116 117 119 120 120 120 120 120 120 120 120 130 135 132 130 122 117 114 114 113];

[fnx,splnx]=meshgrid(1:27,1:7);
[fny,splny]=meshgrid(1:1/9:27,1:1/9:7);
fonx=interp2(fnx,splnx,fon,fny,splny,'bicubic');

mesh(fonx);grid on;


if (f<=100),

	fi=round(9*f/10-17);
	spli=round(9/20*spl+1);
	p=fonx(spli,fi);

end

if (f<=1000)&(f>100),

	fi=round(9*(9+f/100)-17);
	spli=round(9/20*spl+1);
	p=fonx(spli,fi);

end

if (f>1000),

	fi=round(9*(18+f/1000)-17);
	spli=round(9/20*spl+1);
	p=fonx(spli,fi);

end

if (f<20)|(f>10000)|(spl<0)|(spl>120),

	p=-1;


end