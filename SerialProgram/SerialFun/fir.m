function y = fir(x)
%FIR Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 23-Apr-2020 22:18:43

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % Equiripple Bandstop filter designed using the FIRPM function.
    %
    % % All frequency values are in Hz.
    % Fs = 500;  % Sampling Frequency
    %
    % Fpass1 = 40;              % First Passband Frequency
    % Fstop1 = 45;              % First Stopband Frequency
    % Fstop2 = 55;              % Second Stopband Frequency
    % Fpass2 = 60;              % Second Passband Frequency
    % Dpass1 = 0.028774368332;  % First Passband Ripple
    % Dstop  = 0.031622776602;  % Stopband Attenuation
    % Dpass2 = 0.057501127785;  % Second Passband Ripple
    % dens   = 20;              % Density Factor
    %
    % % Calculate the order from the parameters using FIRPMORD.
    % [N, Fo, Ao, W] = firpmord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 0 ...
    %                           1], [Dpass1 Dstop Dpass2]);
    %
    % % Calculate the coefficients using the FIRPM function.
    % b  = firpm(N, Fo, Ao, W, {dens});
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [-0.0214259642425712 0.0179064443542736 ...
        0.00695271917477707 0.000285590031493312 -0.00163093843455733 ...
        0.000118488261471795 0.00345371291247904 0.00610969515644811 ...
        0.00647855079007246 0.00413661122665736 -4.55830724450755e-05 ...
        -0.00432888860943753 -0.00682702882878472 -0.00633119551161343 ...
        -0.00284995221635677 0.00231694930765871 0.00707229882940151 ...
        0.00934926487156277 0.00804735632919077 0.00351483538191895 ...
        -0.00248658817840844 -0.00756369482985587 -0.00963966960973724 ...
        -0.00791828160521888 -0.00320928824981066 0.00242854367496458 ...
        0.0066611074951997 0.00788368646743199 0.00596557379856601 ...
        0.00219153285005129 -0.00144823345074426 -0.00333827936421236 ...
        -0.00300075617045285 -0.0013579676001867 -3.75038559133217e-05 ...
        -0.000379094365606402 -0.00250384448078561 -0.00504462350143636 ...
        -0.00582785866388992 -0.00311816287359295 0.00310010899000172 ...
        0.0106556754930643 0.0158367674735175 0.0150917786419969 ...
        0.00698890211617621 -0.00651817575571481 -0.0203667688642249 ...
        -0.0282180504121251 -0.0253385261338052 -0.0110245788624234 ...
        0.0102690657268055 0.0304308070118787 0.04058118812281 ...
        0.0351674365358069 0.0147096121329392 -0.0138749236830686 ...
        -0.039426288143144 -0.0511390926815003 -0.0431546126784888 ...
        -0.0173983677051533 0.0167744707890101 0.0459736252578523 ...
        0.0582368136473628 0.0480175753514453 0.0187229973412585 ...
        -0.0184870718073122 -0.0490098434886595 0.939247376626845 ...
        -0.0490098434886595 -0.0184870718073122 0.0187229973412585 ...
        0.0480175753514453 0.0582368136473628 0.0459736252578523 ...
        0.0167744707890101 -0.0173983677051533 -0.0431546126784888 ...
        -0.0511390926815003 -0.039426288143144 -0.0138749236830686 ...
        0.0147096121329392 0.0351674365358069 0.04058118812281 ...
        0.0304308070118787 0.0102690657268055 -0.0110245788624234 ...
        -0.0253385261338052 -0.0282180504121251 -0.0203667688642249 ...
        -0.00651817575571481 0.00698890211617621 0.0150917786419969 ...
        0.0158367674735175 0.0106556754930643 0.00310010899000172 ...
        -0.00311816287359295 -0.00582785866388992 -0.00504462350143636 ...
        -0.00250384448078561 -0.000379094365606402 -3.75038559133217e-05 ...
        -0.0013579676001867 -0.00300075617045285 -0.00333827936421236 ...
        -0.00144823345074426 0.00219153285005129 0.00596557379856601 ...
        0.00788368646743199 0.0066611074951997 0.00242854367496458 ...
        -0.00320928824981066 -0.00791828160521888 -0.00963966960973724 ...
        -0.00756369482985587 -0.00248658817840844 0.00351483538191895 ...
        0.00804735632919077 0.00934926487156277 0.00707229882940151 ...
        0.00231694930765871 -0.00284995221635677 -0.00633119551161343 ...
        -0.00682702882878472 -0.00432888860943753 -4.55830724450755e-05 ...
        0.00413661122665736 0.00647855079007246 0.00610969515644811 ...
        0.00345371291247904 0.000118488261471795 -0.00163093843455733 ...
        0.000285590031493312 0.00695271917477707 0.0179064443542736 ...
        -0.0214259642425712]);
end

y = step(Hd,double(x));


% [EOF]