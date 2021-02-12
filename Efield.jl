### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 53c7d9b0-6b89-11eb-398b-675411f493dc
begin
	using Plots
	# Use Plotly plotting backend
	plotlyjs()
end

# ╔═╡ 15c25e30-6bbe-11eb-2e55-cfe5abc44d2b
md"""
Using Gauss' Theorem

$\oint_S \overline{E} \cdot d\overline{s} = \frac{Q_{in}}{\epsilon}$

"""

# ╔═╡ 951df740-6b8a-11eb-2caa-b5a1291edc31
md"""
## E-field in spherical geometry
This claculation describes the strength of an electric field with chrage density $\rho_v$. It is of a spehrical form, with vaccum on the inside (radius less than a) and the outside (radius bigger than b).
"""

# ╔═╡ f87b9c1e-6d6f-11eb-0805-0923965aba3b
ϵ = 8.8541878128e-12

# ╔═╡ 5a5fb850-6b8f-11eb-2d2c-8dcedf10efd9
ρ = 5*10^(-3)

# ╔═╡ 1ed77c60-6bc5-11eb-1a68-e9e8d51f7d87
@bind a html"<input value='1' type='range' max='1' step='' min='0'>"

# ╔═╡ 8fc3f460-6bc7-11eb-26b8-61d35bfa4fef
@bind b html"<input value='2' type='range' step='0.1' max='3' min='2' label='$(b)'>"

# ╔═╡ f0717252-6bc8-11eb-3bfd-d5d0d0fd299c
(a,b)

# ╔═╡ 660d2082-6b89-11eb-100d-8b577e9ae037
function E(r)
	if(r<=a)
		return 0
	elseif(a<r<b)
		return ρ*(r^3-a^3)/(ϵ*(3*r^2))
	else
		return ρ*(b^3-a^3)/(ϵ*(3*r^2))
	end
end

# ╔═╡ 6a2b5b50-6b89-11eb-38e5-33a649d074ae
r = 0:0.001:10

# ╔═╡ 7418b540-6b89-11eb-1f53-89165d55d825
Y = E.(r)

# ╔═╡ 78ff2210-6b89-11eb-29df-c5714c003c7d
plot(r, Y, label="|E|", xlabel="Radius in m (r)", ylabel="Field strength |E|")

# ╔═╡ 6d19078e-6b98-11eb-265b-c913b44ff56a
md"""
## Voltage everywhere around a spherical shell
The shell has a voltage of  $V_o$, determine the voltage as a function of the radius. It is located at r=a.

1. Decide E-field
2. Integrate for the voltage
3. Solve for boundary values


By using symmetry when creating a Gauss surface for r>a

$E_r(r)\cdot 4\pi r^2=\frac{Q_{in}}{\epsilon}$

Which gives us the electric field


$E_r(r)=\frac{Q_{in}}{ 4\pi\epsilon r^2}$

Next we use 

$\overline{E} = - \nabla V$
Because of symmetry, it can be described as

$E_r(r)=-\frac{\partial V}{\partial r}$

Solve for V:

$V(r) = - \int E_r(r)dr = -\int \frac{Q_{in}}{ 4\pi\epsilon r^2}dr = \frac{Q_{in}}{ 4\pi\epsilon r} + C$

Use boundary values

$V(\infty) = C = 0$

$V(a) = V_0 = \frac{Q_{in}}{ 4\pi\epsilon a} \Rightarrow Q_{in} = 4V_0\pi\epsilon a$

For r>a V is:

$V(r) = \frac{V_0 a}{r}$

For r<a V is:

$V(r) = V_0$


"""

# ╔═╡ eaee7830-6b98-11eb-0a38-3b3060407cc1
begin
	#Initilize variables
	V_0 = 10 #Voltage on spehrical shell
	a_r = 2 #Radius where the shell is located
end

# ╔═╡ 0de35890-6bc3-11eb-2e29-0f5ebe681620
function V(r)
	if r<=a_r
		return V_0
	end
	return (V_0*a_r)/r;
end

# ╔═╡ 4e92a440-6bc3-11eb-108c-e1cb845eb432
r_vec = 0:0.01:10

# ╔═╡ 7cf30c32-6bc3-11eb-1e1d-6d3a80c175f6
y = V.(r_vec)

# ╔═╡ 995855b0-6bc3-11eb-013d-29ec57548faf
plot(r_vec, y, xlabel="Radius(r)", ylabel="Volatge(V)", ylim=(0, V_0+1), label="V")

# ╔═╡ Cell order:
# ╠═53c7d9b0-6b89-11eb-398b-675411f493dc
# ╠═15c25e30-6bbe-11eb-2e55-cfe5abc44d2b
# ╟─951df740-6b8a-11eb-2caa-b5a1291edc31
# ╠═f87b9c1e-6d6f-11eb-0805-0923965aba3b
# ╠═5a5fb850-6b8f-11eb-2d2c-8dcedf10efd9
# ╟─1ed77c60-6bc5-11eb-1a68-e9e8d51f7d87
# ╟─8fc3f460-6bc7-11eb-26b8-61d35bfa4fef
# ╠═f0717252-6bc8-11eb-3bfd-d5d0d0fd299c
# ╠═660d2082-6b89-11eb-100d-8b577e9ae037
# ╠═6a2b5b50-6b89-11eb-38e5-33a649d074ae
# ╠═7418b540-6b89-11eb-1f53-89165d55d825
# ╟─78ff2210-6b89-11eb-29df-c5714c003c7d
# ╟─6d19078e-6b98-11eb-265b-c913b44ff56a
# ╠═eaee7830-6b98-11eb-0a38-3b3060407cc1
# ╠═0de35890-6bc3-11eb-2e29-0f5ebe681620
# ╠═4e92a440-6bc3-11eb-108c-e1cb845eb432
# ╠═7cf30c32-6bc3-11eb-1e1d-6d3a80c175f6
# ╟─995855b0-6bc3-11eb-013d-29ec57548faf
