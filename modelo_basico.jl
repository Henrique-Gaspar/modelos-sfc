using Plots

nperiods = 65;
	
Y = zeros(nperiods,1);
C = zeros(nperiods,1);
G = zeros(nperiods,1);
T = zeros(nperiods,1);
YD = zeros(nperiods,1);
ΔHₛ = zeros(nperiods,1);
ΔHₕ = zeros(nperiods,1);
ΔHₑ = zeros(nperiods,1);
H = zeros(nperiods,1);
YDᵉ = zeros(nperiods,1);



Θ = 0.2;
α₁ = 0.7;
α₂ = 0.3;
λ₀ = 0.635;
λ₁ = 5;
λ₂ = 0.01;
r̄ = 2.5;

    
for t in [2:nperiods...]
    for j in [1:20...]
        if t >= 14
            G[t] = 20
        Y[t] = C[t] + G[t]
        T[t] = Θ * Y[t]
        YD[t] = Y[t] - T[t]
        ΔHₛ[t] = G[t] - T[t]
        ΔHₕ[t] = YD[t] - C[t]
        H[t] = ΔHₛ[t] + H[t-1]
        C[t] = (α₁ * YD[t]) + (α₂ * H[t-1])
        YDᵉ[t] = YD[t-1]
        ΔHₑ[t] = YDᵉ[t] .- C[t]
        end
    end
end

periodos = [1:nperiods...];

matriz_modelo = [periodos G Y T YD ΔHₛ ΔHₕ ΔHₑ H C YDᵉ]

plot(periodos, G, label="Gasto do gov.", linestyle=:dash, legend=:outertop)
plot!(Y, label="Produto")