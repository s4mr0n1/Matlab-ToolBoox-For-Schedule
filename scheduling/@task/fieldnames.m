function [Props,AsgnVals,DefVal] = fieldnames(task)
%FIELDNAMES  All public properties and their assignable values and default
%           value
%
%   [PROPS,ASGNVALS,DEFVAL] = FIELDNAMES(TASK)  
%     PROPS    - list of public properties of the object TASK (a cell vector)
%     ASGNVALS - assignable values for these properties (a cell vector)
%     DEFVAL   - default values
%
%   See also  SCHEDOBJ/GET, SCHEDOBJ/SET.


% Author: Michal Kutil <kutilm@fel.cvut.cz>
% Originator: Michal Kutil <kutilm@fel.cvut.cz>
% Originator: Premysl Sucha <suchap@fel.cvut.cz>
% Project Responsible: Zdenek Hanzalek
% Department of Control Engineering
% FEE CTU in Prague, Czech Republic
% Copyright (c) 2004 - 2009 
% $Revision: 2897 $  $Date:: 2009-03-18 15:17:31 +0100 #$


% This file is part of TORSCHE Scheduling Toolbox for Matlab.
% TORSCHE Scheduling Toolbox for Matlab can be used, copied 
% and modified under the next licenses
%
% - GPL - GNU General Public License
%
% - and other licenses added by project originators or responsible
%
% Code can be modified and re-distributed under any combination
% of the above listed licenses. If a contributor does not agree
% with some of the licenses, he/she can delete appropriate line.
% If you delete all lines, you are not allowed to distribute 
% source code and/or binaries utilizing code.
%
% --------------------------------------------------------------
%                  GNU General Public License  
%
% TORSCHE Scheduling Toolbox for Matlab is free software;
% you can redistribute it and/or modify it under the terms of the
% GNU General Public License as published by the Free Software
% Foundation; either version 2 of the License, or (at your option)
% any later version.
% 
% TORSCHE Scheduling Toolbox for Matlab is distributed in the hope
% that it will be useful, but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or 
% FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with TORSCHE Scheduling Toolbox for Matlab; if not, write
% to the Free Software Foundation, Inc., 59 Temple Place,
% Suite 330, Boston, MA 02111-1307 USA
 

% Get parent object properties
[Props,AsgnVals,DefVal] = fieldnames(getfield(struct(task), task.parent));

% Add TASK properties
Props = {'Name' 'ProcTime' 'ReleaseTime' 'Deadline' 'DueDate' 'Weight' 'Processor' 'UserParam' Props{:}}; %'ALAP' 'ASAP'

% Also return assignable values if needed
if nargout>1,
    
    AsgnVals = {'name of the TASK' ...
                'processing time' ...
                'release time (arrival time)' ...
                'deadline' ...
                'duedate' ...
                'weight (priority)' ...
                'dedicated processor' ...
                'user parameters' ...
                AsgnVals{:}};
        
%                 'ALAP AsLateAsPosible' ...
%                 'ASAP AsSonAsPosible' ...


    if nargout>2,
        DefVal = {''  -inf  0  inf  inf  1 [] [] DefVal{:}};
    end
end

%end .. @task/fieldnames
