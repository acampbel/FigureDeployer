classdef tSmokeFigureDeployerDoc < matlab.unittest.TestCase        properties (TestParameter)        DocFile = struct('FigureDeployerDoc', {@FigureDeployerDoc});    end        methods (TestClassSetup)                % Shut off graphics warnings        function killGraphicsWarning(testCase)            ws = warning('off', 'MATLAB:hg:AutoSoftwareOpenGL');            testCase.addTeardown(@()warning(ws));                    end                % Close any new figures created by doc        function saveExistingFigures(testCase)                        existingfigs = findall(groot, 'Type', 'Figure');            testCase.addTeardown(@()delete(setdiff(findall(groot, 'Type', 'Figure'), existingfigs)))                    end            end        methods (Test)                function docShouldNotWarn(testCase, DocFile)                   testCase.verifyWarningFree(DocFile);                    end            endend% Copyright 2020 The MathWorks, Inc.