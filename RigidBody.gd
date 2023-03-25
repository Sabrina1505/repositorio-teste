extends RigidBody
var direcao = Vector3.DOWN
func _physics_process(_delta):
	movimentacao()
func movimentacao():
	direcao = Vector3.BACK
	var posicaoInicial = self.translation
	var posicaoFinal = posicaoInicial + (direcao*2)
	$Movimentacao.interpolate_property(self, "translation", posicaoInicial, posicaoFinal, 0.1, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Movimentacao.start()
