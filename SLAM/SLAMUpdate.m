function [x_new, P_new] = SLAMUpdate(u, z_raw, x, P)

% laser_scan - raw laser scan from GetLaserScans()
% x - state vector
% P - covariance matrix for 'x'
% u - relative vehicle motion estimate

% TODO: actually, need to run this even if we detect no poles; just run
% prediction?
if ~isempty(z_raw)
    [x_pred, P_pred] = SLAMPrediction(u, x, P);
    z = SLAMDataAssociations(x_pred, z_raw');
    [x_new, P_new] = SLAMMeasurement(z, x_pred, P_pred);
else
    x_new = x;
    P_new = P;
end

end

