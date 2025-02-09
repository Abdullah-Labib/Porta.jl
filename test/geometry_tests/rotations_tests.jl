p = ℝ³(rand(3))
q = Quaternion(rand() * 2pi, normalize(ℝ³(rand(3))))
q₀ = Quaternion(0, normalize(ℝ³(rand(3))))
q2 = normalize(Quaternion(rand(4)))
points = [ℝ³(rand(3)) for i in 1:5]
i = ℝ³(1, 0, 0)
j = ℝ³(0, 1, 0)
k = ℝ³(0, 0, 1)
g = getrotation(i, j)


@test typeof(rotate(p, q)) == typeof(p)
@test isapprox(rotate(p, q₀), p) # rotations with angle zero
@test typeof(rotate(points, q)) == typeof(points) # Array input
@test isapprox(g, Quaternion(pi / 4, k))


q = Biquaternion(Quaternion(rand() * 2pi - pi, ℝ³(rand(3))), ℝ³(rand(3)))
transformed = applyconfig(points, q)

@test typeof(transformed) == typeof(points)
@test size(transformed) == size(points)
@test isapprox(transformed, points) == false
