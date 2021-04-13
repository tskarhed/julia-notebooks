### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 04af0d10-9070-11eb-2fbf-493475b83bd0
using Plots

# ╔═╡ bca6bf50-915e-11eb-11e8-1d2fc21da187
using CSV;

# ╔═╡ 1b7aa6b0-906d-11eb-1bcd-9fd48415fade
md"""
# Solving for resistance

The problem is setup as a rectangle with width 2L and height 2b. In the center there is a hole with radius a. The conductivtiy of the material is $\sigma$. a will be varied.

$ R = \frac{b}{\sigma L}\frac{L^2+a^2}{b^2-a^2} $
"""

# ╔═╡ a6e8f7a0-906e-11eb-1a0e-51f4a4b751f7
σ = 5.998e7;

# ╔═╡ d3572c80-906e-11eb-0a39-73a83bffb283
b = 30;

# ╔═╡ d9e9e9c0-906e-11eb-2507-2bf61260bf5a
L = 50;

# ╔═╡ 94eb35b0-9161-11eb-1c77-5d337997146a
simulationData = CSV.File("./data/resistance2.csv")

# ╔═╡ de4fdbf2-906e-11eb-2715-6f5bc8d68d2a
a = simulationData.a; #Use same values of a as in the simulation

# ╔═╡ 03943b70-9166-11eb-3f37-6fe974598a65
simulationData.R

# ╔═╡ 662d3360-906f-11eb-2826-d18803f2c32e
R = (b*(L^2 .+ a.^2))./(σ*L*(b^2 .- a.^2))

# ╔═╡ 3c5e1dee-9070-11eb-1369-6509d6df4f3c
plot(a, R, xlabel="a [m]", ylabel="Resistance [Ohms]", label="Analytical R")

# ╔═╡ 6fb114e0-9166-11eb-36af-a5a5faa376e1
plot(a, simulationData.R, xlabel="a [m]", ylabel="Resistance [Ohms]", label="Simulated R")

# ╔═╡ 5ff3b170-9166-11eb-25e0-1f2818ee7004
plot(a, [R simulationData.R], xlabel="a [m]", ylabel="Resistance [Ohms] (log)", label=["Analytical R" "Simulated R"], yaxis=:log)

# ╔═╡ 09dae670-9164-11eb-1ef0-f14e5b401a2d
ϵ = abs.((simulationData.R - R) ./ (simulationData.R + R))

# ╔═╡ 89572940-9164-11eb-1669-41593429cd22
plot(a, ϵ, xlabel="a [m]", ylabel="Difference in result", label="Epsilon")

# ╔═╡ Cell order:
# ╟─1b7aa6b0-906d-11eb-1bcd-9fd48415fade
# ╠═04af0d10-9070-11eb-2fbf-493475b83bd0
# ╠═bca6bf50-915e-11eb-11e8-1d2fc21da187
# ╠═a6e8f7a0-906e-11eb-1a0e-51f4a4b751f7
# ╠═d3572c80-906e-11eb-0a39-73a83bffb283
# ╠═d9e9e9c0-906e-11eb-2507-2bf61260bf5a
# ╠═94eb35b0-9161-11eb-1c77-5d337997146a
# ╠═de4fdbf2-906e-11eb-2715-6f5bc8d68d2a
# ╠═03943b70-9166-11eb-3f37-6fe974598a65
# ╠═662d3360-906f-11eb-2826-d18803f2c32e
# ╠═3c5e1dee-9070-11eb-1369-6509d6df4f3c
# ╠═6fb114e0-9166-11eb-36af-a5a5faa376e1
# ╠═5ff3b170-9166-11eb-25e0-1f2818ee7004
# ╠═09dae670-9164-11eb-1ef0-f14e5b401a2d
# ╠═89572940-9164-11eb-1669-41593429cd22
