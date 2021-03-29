### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 04af0d10-9070-11eb-2fbf-493475b83bd0
using Plots

# ╔═╡ 1b7aa6b0-906d-11eb-1bcd-9fd48415fade
md"""
# Solving for resistance

The problem is setup as a rectangle with width 2L and height 2b. In the center there is a hole with radius a. The conductivtiy of the material is $\sigma$. a will be varied.

$ R = \frac{b}{\sigma L}\frac{b(L^2+a^2)}{b^2-a^2} $
"""

# ╔═╡ a6e8f7a0-906e-11eb-1a0e-51f4a4b751f7
σ = 5.998e7;

# ╔═╡ d3572c80-906e-11eb-0a39-73a83bffb283
b = 30;

# ╔═╡ d9e9e9c0-906e-11eb-2507-2bf61260bf5a
L = 50;

# ╔═╡ de4fdbf2-906e-11eb-2715-6f5bc8d68d2a
a = 1:b/2;

# ╔═╡ 662d3360-906f-11eb-2826-d18803f2c32e
R = (b^2*(L^2 .+ a.^2))/(σ*L*(b^2 .- a.^2))

# ╔═╡ 3c5e1dee-9070-11eb-1369-6509d6df4f3c
plot(a, R[:,1], xlabel="a [m]", ylabel="Resistance [Ohms]", label="R")

# ╔═╡ Cell order:
# ╠═1b7aa6b0-906d-11eb-1bcd-9fd48415fade
# ╠═04af0d10-9070-11eb-2fbf-493475b83bd0
# ╠═a6e8f7a0-906e-11eb-1a0e-51f4a4b751f7
# ╠═d3572c80-906e-11eb-0a39-73a83bffb283
# ╠═d9e9e9c0-906e-11eb-2507-2bf61260bf5a
# ╠═de4fdbf2-906e-11eb-2715-6f5bc8d68d2a
# ╠═662d3360-906f-11eb-2826-d18803f2c32e
# ╠═3c5e1dee-9070-11eb-1369-6509d6df4f3c
