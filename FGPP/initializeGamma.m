function gamma = initializeGamma(inedges, outedges, prior ,params)
U = params.U;
P = params.P;
K = params.K;

gamma = struct;
gamma.tau_rte = zeros(U,U);
gamma.tau_shp = zeros(U,U);
for u=1:U
    for v=inedges{u}
        gamma.tau_shp(v,u) = rand();
        gamma.tau_rte(v,u) = rand();
    end
end
gamma.m_shp = rand(U,1);
gamma.m_rte = rand(U,1);
gamma.v = rand(U,K);
gamma.beta_shp = rand(P,K);
gamma.beta_rte = rand(P,K);
gamma.eta_shp = zeros(U,1);
gamma.eta_rte = rand(U,1);
gamma.mu_shp = zeros(U,1);
gamma.mu_rte = rand(U,1);
gamma.ksi_shp = zeros(P,1);
gamma.ksi_rte = rand(P,1);
for u=1:U
    gamma.eta_shp(u) = prior.shape.eta+prior.shape.m;
end
for u=1:U
    gamma.mu_shp(u) = prior.shape.mu + length(outedges{u})*prior.shape.tau;    
end
for p=1:P
    gamma.ksi_shp(p) = prior.shape.ksi + K*prior.shape.beta;
end
end
