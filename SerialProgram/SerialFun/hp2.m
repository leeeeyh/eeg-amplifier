function y = hp2(x)
%HP2 Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 10-Jul-2020 08:05:28

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % Equiripple Highpass filter designed using the FIRPM function.
    %
    % % All frequency values are in Hz.
    % Fs = 250;  % Sampling Frequency
    %
    % Fstop = 0.5;             % Stopband Frequency
    % Fpass = 2;               % Passband Frequency
    % Dstop = 0.0001;          % Stopband Attenuation
    % Dpass = 0.057501127785;  % Passband Ripple
    % dens  = 20;              % Density Factor
    %
    % % Calculate the order from the parameters using FIRPMORD.
    % [N, Fo, Ao, W] = firpmord([Fstop, Fpass]/(Fs/2), [0 1], [Dstop, Dpass]);
    %
    % % Calculate the coefficients using the FIRPM function.
    % b  = firpm(N, Fo, Ao, W, {dens});
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [0.0133230639186634 -0.000664377685270206 ...
        -0.000650431088993651 -0.000636822674677432 -0.000625848454715167 ...
        -0.000615036193681732 -0.000606749319247683 -0.000598557118425168 ...
        -0.000592712884063528 -0.000586676479079238 -0.000582885235569645 ...
        -0.000578950651274882 -0.000576955225490007 -0.000574654943946124 ...
        -0.000574299676454593 -0.000573287405048494 -0.000574213624075751 ...
        -0.000574315155918538 -0.000576211638262696 -0.000577145306270541 ...
        -0.00057976264227911 -0.000581208069757763 -0.000584242447850895 ...
        -0.000585910217908694 -0.000589088098225795 -0.000590686872258915 ...
        -0.000593815299367223 -0.000595081728197374 -0.000597895612585052 ...
        -0.000598648638454205 -0.000600815680689134 -0.000600744336694172 ...
        -0.000602157381153798 -0.000600829713879894 -0.00060139353102365 ...
        -0.000598646930743547 -0.000598192176250919 -0.000593377737016067 ...
        -0.000592229494571935 -0.000583711927178193 -0.000580395420651858 ...
        -0.000586229000040865 -0.000561226039204643 -0.000555028896188549 ...
        -0.000546221406357564 -0.000539521453450727 -0.000528998777395569 ...
        -0.000517849604443454 -0.000503529195184324 -0.000488315463004731 ...
        -0.000471046700386538 -0.000452894562151832 -0.000433063463032601 ...
        -0.000412607652586679 -0.000390724480069488 -0.000367956544153512 ...
        -0.000344071750319071 -0.000318946560497575 -0.00029275422670849 ...
        -0.000265142249140972 -0.000236461867324068 -0.000206214412460557 ...
        -0.000174971062396214 -0.000142068918885295 -0.000108239069714833 ...
        -7.27132877711226e-05 -3.63915558941296e-05 1.70202813125942e-06 ...
        4.03350291936281e-05 8.07735052612222e-05 0.000121564332270426 ...
        0.00016400581139734 0.000206701294945609 0.000251011063785567 ...
        0.000295239541318007 0.00034129228854793 0.000386880583332736 ...
        0.00043439763828099 0.000480784312693691 0.00052993265674409 ...
        0.000576111283521602 0.000626264564052456 0.000677281236272165 ...
        0.000722195292407179 0.00077223718570833 0.000821847610511744 ...
        0.00087228235276636 0.00092137524131404 0.000970222195743584 ...
        0.00101809278535289 0.00106584333286961 0.00111327437123328 ...
        0.0011603129082469 0.00120667271444651 0.00125261306022326 ...
        0.0012974440412923 0.00134134705241734 0.00138407867340916 ...
        0.00142538423765055 0.00146540430924772 0.00150377439572155 ...
        0.00154074646015032 0.00157585745029199 0.00160947453673932 ...
        0.00164100718713862 0.00167084817058693 0.00169837077462413 ...
        0.00172400913535314 0.00174699618627113 0.00176800844702309 ...
        0.00178602120815156 0.00180188711466136 0.00181456878255796 ...
        0.00182480856088843 0.00183163219682057 0.00183592170100337 ...
        0.00183640717955629 0.00183434211231431 0.0018282283620562 ...
        0.00181974094261616 0.00180634078726338 0.00179164614570039 ...
        0.00177069140658089 0.00174692964461677 0.00172128182559427 ...
        0.00169008260208106 0.00165493504337448 0.00161574277968463 ...
        0.00157296722415371 0.0015263751519021 0.00147575893019113 ...
        0.00142091631449253 0.00136134334303198 0.00129781226291068 ...
        0.00122990195287946 0.00115768282386448 0.00108139151114148 ...
        0.00100083535855374 0.00091596298004908 0.000826944279399496 ...
        0.000733444954797824 0.000635773334198868 0.000533580354235689 ...
        0.000427304184326943 0.000316530405511908 0.000201799872601475 ...
        8.27125812593173e-05 -4.02456138570054e-05 -0.000167459670496577 ...
        -0.000298386874807965 -0.000433596762925144 -0.000572311491706106 ...
        -0.000715247791404158 -0.000861588830850781 -0.00101191593333825 ...
        -0.00116550809367649 -0.00132296591341199 -0.00148340177221977 ...
        -0.00164759604902313 -0.00181457131803963 -0.0019852543643978 ...
        -0.00215793563826062 -0.00233500453299262 -0.00251274162846685 ...
        -0.00269420920757564 -0.00287853434184158 -0.00306464412170175 ...
        -0.00325256157672123 -0.00344271661968639 -0.00363470992670772 ...
        -0.00382880821564663 -0.00402430289053975 -0.00422132182943994 ...
        -0.00441880381923495 -0.00461805472775016 -0.00481785001918796 ...
        -0.00501852738358088 -0.00521979768186164 -0.00542144938401781 ...
        -0.00562312162157596 -0.00582490377210885 -0.00602624006419405 ...
        -0.00622733516483329 -0.00642763343621786 -0.00662742873139676 ...
        -0.00682605054378316 -0.00702384084334227 -0.00722012852018871 ...
        -0.0074151267209912 -0.0076082394447547 -0.0077996808641409 ...
        -0.00798874603812185 -0.00817586397171316 -0.00836019923006194 ...
        -0.00854222600762377 -0.00872121217618277 -0.00889749912920845 ...
        -0.00907037291777638 -0.0092402301036871 -0.00940629337496839 ...
        -0.00956892288131465 -0.00972738742529497 -0.00988249293834126 ...
        -0.0100324016761975 -0.0101795575449546 -0.0103211328983087 ...
        -0.0104581951719516 -0.0105904963325373 -0.010718380105686 ...
        -0.0108409199994208 -0.0109585796620357 -0.0110705060169444 ...
        -0.0111772565523655 -0.0112783128803197 -0.0113747538505741 ...
        -0.0114643898133268 -0.0115489031459532 -0.0116271750376247 ...
        -0.0116996181870526 -0.0117659331519521 -0.0118263601925122 ...
        -0.0118804110247436 -0.0119284598765328 -0.011969993674557 ...
        -0.0120053969524489 -0.0120341273640574 -0.0120567307558878 ...
        -0.012072623376687 -0.0120823435910577 0.987914545693163 ...
        -0.0120823435910577 -0.012072623376687 -0.0120567307558878 ...
        -0.0120341273640574 -0.0120053969524489 -0.011969993674557 ...
        -0.0119284598765328 -0.0118804110247436 -0.0118263601925122 ...
        -0.0117659331519521 -0.0116996181870526 -0.0116271750376247 ...
        -0.0115489031459532 -0.0114643898133268 -0.0113747538505741 ...
        -0.0112783128803197 -0.0111772565523655 -0.0110705060169444 ...
        -0.0109585796620357 -0.0108409199994208 -0.010718380105686 ...
        -0.0105904963325373 -0.0104581951719516 -0.0103211328983087 ...
        -0.0101795575449546 -0.0100324016761975 -0.00988249293834126 ...
        -0.00972738742529497 -0.00956892288131465 -0.00940629337496839 ...
        -0.0092402301036871 -0.00907037291777638 -0.00889749912920845 ...
        -0.00872121217618277 -0.00854222600762377 -0.00836019923006194 ...
        -0.00817586397171316 -0.00798874603812185 -0.0077996808641409 ...
        -0.0076082394447547 -0.0074151267209912 -0.00722012852018871 ...
        -0.00702384084334227 -0.00682605054378316 -0.00662742873139676 ...
        -0.00642763343621786 -0.00622733516483329 -0.00602624006419405 ...
        -0.00582490377210885 -0.00562312162157596 -0.00542144938401781 ...
        -0.00521979768186164 -0.00501852738358088 -0.00481785001918796 ...
        -0.00461805472775016 -0.00441880381923495 -0.00422132182943994 ...
        -0.00402430289053975 -0.00382880821564663 -0.00363470992670772 ...
        -0.00344271661968639 -0.00325256157672123 -0.00306464412170175 ...
        -0.00287853434184158 -0.00269420920757564 -0.00251274162846685 ...
        -0.00233500453299262 -0.00215793563826062 -0.0019852543643978 ...
        -0.00181457131803963 -0.00164759604902313 -0.00148340177221977 ...
        -0.00132296591341199 -0.00116550809367649 -0.00101191593333825 ...
        -0.000861588830850781 -0.000715247791404158 -0.000572311491706106 ...
        -0.000433596762925144 -0.000298386874807965 -0.000167459670496577 ...
        -4.02456138570054e-05 8.27125812593173e-05 0.000201799872601475 ...
        0.000316530405511908 0.000427304184326943 0.000533580354235689 ...
        0.000635773334198868 0.000733444954797824 0.000826944279399496 ...
        0.00091596298004908 0.00100083535855374 0.00108139151114148 ...
        0.00115768282386448 0.00122990195287946 0.00129781226291068 ...
        0.00136134334303198 0.00142091631449253 0.00147575893019113 ...
        0.0015263751519021 0.00157296722415371 0.00161574277968463 ...
        0.00165493504337448 0.00169008260208106 0.00172128182559427 ...
        0.00174692964461677 0.00177069140658089 0.00179164614570039 ...
        0.00180634078726338 0.00181974094261616 0.0018282283620562 ...
        0.00183434211231431 0.00183640717955629 0.00183592170100337 ...
        0.00183163219682057 0.00182480856088843 0.00181456878255796 ...
        0.00180188711466136 0.00178602120815156 0.00176800844702309 ...
        0.00174699618627113 0.00172400913535314 0.00169837077462413 ...
        0.00167084817058693 0.00164100718713862 0.00160947453673932 ...
        0.00157585745029199 0.00154074646015032 0.00150377439572155 ...
        0.00146540430924772 0.00142538423765055 0.00138407867340916 ...
        0.00134134705241734 0.0012974440412923 0.00125261306022326 ...
        0.00120667271444651 0.0011603129082469 0.00111327437123328 ...
        0.00106584333286961 0.00101809278535289 0.000970222195743584 ...
        0.00092137524131404 0.00087228235276636 0.000821847610511744 ...
        0.00077223718570833 0.000722195292407179 0.000677281236272165 ...
        0.000626264564052456 0.000576111283521602 0.00052993265674409 ...
        0.000480784312693691 0.00043439763828099 0.000386880583332736 ...
        0.00034129228854793 0.000295239541318007 0.000251011063785567 ...
        0.000206701294945609 0.00016400581139734 0.000121564332270426 ...
        8.07735052612222e-05 4.03350291936281e-05 1.70202813125942e-06 ...
        -3.63915558941296e-05 -7.27132877711226e-05 -0.000108239069714833 ...
        -0.000142068918885295 -0.000174971062396214 -0.000206214412460557 ...
        -0.000236461867324068 -0.000265142249140972 -0.00029275422670849 ...
        -0.000318946560497575 -0.000344071750319071 -0.000367956544153512 ...
        -0.000390724480069488 -0.000412607652586679 -0.000433063463032601 ...
        -0.000452894562151832 -0.000471046700386538 -0.000488315463004731 ...
        -0.000503529195184324 -0.000517849604443454 -0.000528998777395569 ...
        -0.000539521453450727 -0.000546221406357564 -0.000555028896188549 ...
        -0.000561226039204643 -0.000586229000040865 -0.000580395420651858 ...
        -0.000583711927178193 -0.000592229494571935 -0.000593377737016067 ...
        -0.000598192176250919 -0.000598646930743547 -0.00060139353102365 ...
        -0.000600829713879894 -0.000602157381153798 -0.000600744336694172 ...
        -0.000600815680689134 -0.000598648638454205 -0.000597895612585052 ...
        -0.000595081728197374 -0.000593815299367223 -0.000590686872258915 ...
        -0.000589088098225795 -0.000585910217908694 -0.000584242447850895 ...
        -0.000581208069757763 -0.00057976264227911 -0.000577145306270541 ...
        -0.000576211638262696 -0.000574315155918538 -0.000574213624075751 ...
        -0.000573287405048494 -0.000574299676454593 -0.000574654943946124 ...
        -0.000576955225490007 -0.000578950651274882 -0.000582885235569645 ...
        -0.000586676479079238 -0.000592712884063528 -0.000598557118425168 ...
        -0.000606749319247683 -0.000615036193681732 -0.000625848454715167 ...
        -0.000636822674677432 -0.000650431088993651 -0.000664377685270206 ...
        0.0133230639186634]);
end

y = step(Hd,double(x));


% [EOF]