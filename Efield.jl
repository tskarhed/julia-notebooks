### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 53c7d9b0-6b89-11eb-398b-675411f493dc
begin
	using Plots
	# Use Plotly plotting backend
	plotlyjs()
	# Define variables
	a = 1
	b = 2
	ρ = 5*10^(-3)
end

# ╔═╡ 951df740-6b8a-11eb-2caa-b5a1291edc31
md"""
This claculation describes the strength of an electric firld with chrage density $\rho_v$. It is of a spehrical form, with vaccum on the inside (radius less than a) and the outside (radius bigger than b).
"""

# ╔═╡ 660d2082-6b89-11eb-100d-8b577e9ae037
function E(r)
	if(r<=a)
		return 0
	elseif(a<r<b)
		return ρ*(r^3-a^3)/(3*r^2)
	else
		return ρ*(b^3-a^3)/(3*r^2)
	end
end

# ╔═╡ 6a2b5b50-6b89-11eb-38e5-33a649d074ae
r = 0:0.001:5

# ╔═╡ 7418b540-6b89-11eb-1f53-89165d55d825
Y = E.(r)

# ╔═╡ 78ff2210-6b89-11eb-29df-c5714c003c7d
plot(r, Y)

# ╔═╡ 88733590-6b8b-11eb-1471-b166af5424eb


# ╔═╡ 74044d70-6b8a-11eb-38ca-1160533f3a25


# ╔═╡ 81c9cdf0-6b89-11eb-0b79-05aaccb6ce22


# ╔═╡ Cell order:
# ╠═53c7d9b0-6b89-11eb-398b-675411f493dc
# ╟─951df740-6b8a-11eb-2caa-b5a1291edc31
# ╠═660d2082-6b89-11eb-100d-8b577e9ae037
# ╠═6a2b5b50-6b89-11eb-38e5-33a649d074ae
# ╠═7418b540-6b89-11eb-1f53-89165d55d825
# ╠═78ff2210-6b89-11eb-29df-c5714c003c7d
# ╠═88733590-6b8b-11eb-1471-b166af5424eb
# ╠═74044d70-6b8a-11eb-38ca-1160533f3a25
# ╠═81c9cdf0-6b89-11eb-0b79-05aaccb6ce22
