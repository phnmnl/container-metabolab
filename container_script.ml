% Processing script for MetaboLab
% Comments start with a percentage sign
% Everything between START and END MLScript is executed
% everything outside is ignored
% The script starts in the next line
START MLScript

% Read in 1D raw NMR data (Bruker/Agilent)
read1d
%    dataPath: /mydata/ADG10003u_[116] %works
%    dataPath: /mydata/ADG10003u_[117] %works 
%    dataPath: /mydata/ADG10003u_[116:117]  %only 116 is in matfile
 %   dataPath: /mydata/ADG19007u_[404] %works 
    dataPath: /mydata/ADG19007u_[404] /mydata/ADG10003u_[116:118] 
%    dataPath: /mydata/ADG10003u_[116:117] /mydata/ADG19007u_[404] % only 116 is in matfile
    dataSets: 10  
    spcSet:   1
endRead1d

% Set processing parameters
procpars1d
    dataSetsP: all               % set parameters for all data sets
    % All processing parameters below are the default values used, when no parameters are specified
    % Apodisation functions
         wdwf: EM                % window function 
           lb: 0.3               % line broadening 
          smo: 2                 % water suppression 
          sol: 32 32 0           % parameters for sol
    autophase: 5                 % automatic phase correction (0: none / 4: apk4 / 5: apk5)
          ph0: current                 % zero order phase correction
          ph1: current                 % first order phase correction
           zf: 131072            % zero filling
          ref: auto              % referencing information (use DSS/TMSP if 'auto' / 
                                 % use middle of spectrum as water shift if 'water')
                                 % provide referencing information as 
                                 % ref_shift ref_point # points spectral width spectrometer frequency
                                 % e.g.: 4.7458 65536 131072 7288.6 600.13
    autoBaseline: 1
endProcpars1d

% Process 1D spectra
proc1d
    dataSets: all
endProc1d

% Set data pre-processing parameters
metabolabParameters
    alignCSMaxShift: 100     % max shift for TMSP/DSS alignment
    baselineSpline:  1       % perform spline baseline correction
    baselineAuto:    0       % perform automatic baseline corretion
    sblPoints:  23 552 1373 2865 7095 12999 18233 21033 55000 104886 107960 112878 116895 122707 126359 131049 % datapoints for spline
    sblAveragePoints: 20     % average sblAveragePoints to determine baseline point value
    sblLinearPoints: 250     % interpolate baseline with a line if two adjacent baseline points are further apart than  sblLinearPoints
    sblLinear:       1       % use linear spline when using spline baseline correction
    excludeStart:    100.0 5.2    0.5  % define beginning of regions to exclude
    excludeStop:       9.5 4.6 -100.0  % define end of regions to exclude
    segAlignStart:   9.3766 9.2033 8.8889 6.2017 5.5775  % define beginning of regions for segmental alignment
    segAlignStop:    9.3081 9.1066 8.8203 5.8510 5.4274  % define end of regions for segmental alignment
    segAlignMaxShift: 250    % Maximum shift for segmental alignment
    bucketSize:      0.005   % bucket size [ppm]
    bucketSizePoints: 64     % bucket size [points] <-- if both are defined, ppm takes priority
    glogLambda:      1e-14   % lambda for generalised log transform
    glog_y0:         0.0001  % y0 for generalised log transform
    glogMinLev:      0.1     % minLev for generalised log transform
    noiseThreshold:  4       % percentage of maximum signal height for noise filtering
    noiseStart:      9.5     % start of noise region [ppm]
    noiseEnd:        10      % end of noise region [ppm]
    exportPath:      /mydata      % path for mat/bruker/tree file export
    brukerExpNumbers: bruker
    brukerDataSets:   bruker
    exportFile:      MTBLS1output  % directory name for mat/bruker/tree file export
    moveSpectraBetweenWorkspaces: 0                         % Avoid duplication of data to save memory (if 1)
endMetabolabParameters

% Execute pre-processing operations
metabolabCommands
    alignTMSP:          1
    baselineCorrection: 0
    excludeRegions:     1
    alignSpc:           0
    segmentalAlignment: 0
    noiseFilter:        0
    bucket:             0
    tsaScaling:         0
    pqnScaling:         1
    autoScale:          0
    paretoScale:        0
    glogScale:          0
    exportBruker:       1
    exportMatFile:      1
    exportTreeFile:     0
    exportBatmanFile:   1
endMetabolabCommands

% Create IsaTab file
isatab
    pathName: /mydata        % example script: replace-with-path-name
    fileName: nometa.txt
    flag1: 1
endIsatab

% Save processed data to mat file
save
    dataPath: /mydata
    dataFile: metabolabnotgui.mat
endSave

% End of script
END MLScript
