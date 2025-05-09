#import Pkg
#Pkg.activate(".")
# 必要なパッケージをインポート
using FastGaussQuadrature, LinearAlgebra

# 積分したい関数を定義
f(x) = sqrt(1 - x^2)

# 積分点数を指定（10点ガウス積分）
x, w = gausslegendre(10)

# 関数をベクトル化して評価
fx = f.(x)

# 積分を計算（内積）
result = dot(w, fx)

# 結果表示
println("数値積分の結果: ", result)

# 解析解（π / 2）
exact = π / 2
println("解析解 (π/2): ", exact)

# 誤差の評価
abs_error = abs(result - exact)
println("絶対誤差: ", abs_error)

# 近似判定（許容誤差を変えて評価）
println("isapprox(result, π/2): ", isapprox(result, exact))
println("isapprox(result, π/2; atol=1e-10): ", isapprox(result, exact; atol=1e-10))
println("isapprox(result, π/2; atol=1e-15): ", isapprox(result, exact; atol=1e-15))
