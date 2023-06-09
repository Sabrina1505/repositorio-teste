extends Area

var direcao = Vector3.ZERO

func _physics_process(_delta):
	movimentacao()
	
func movimentacao():
	direcao = Vector3.ZERO
	var rotacaoInicial = $Malha.rotation_degrees.y
	var rotacaoFinal = $Malha.rotation_degrees.y
	if Input.is_action_pressed("ui_up"):
		if not $Frente.is_colliding() : direcao = Vector3.BACK
		if rotacaoInicial != 0.0: rotacaoFinal = 0.0
	elif Input.is_action_pressed("ui_left"):
		if not $Esquerda.is_colliding() : direcao = Vector3.RIGHT
		if rotacaoInicial != 90: rotacaoFinal = 90
	elif Input.is_action_pressed("ui_right"):
		if not $Direita.is_colliding() : direcao = Vector3.LEFT
		if rotacaoInicial != -90: rotacaoFinal = -90
	elif Input.is_action_pressed("ui_down"):
		if not $Costas.is_colliding() : direcao = -Vector3.BACK
		if rotacaoInicial != 180: rotacaoFinal = 180	
	var posicaoInicial = self.translation
	var posicaoFinal = posicaoInicial + (direcao*2)
	$Movimentacao.interpolate_property(self, "translation", posicaoInicial, posicaoFinal, 0.1, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Movimentacao.start()
	
	$Rotacao.interpolate_property($Malha, "rotation_degrees:y", rotacaoInicial, rotacaoFinal, 0.1, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Rotacao.start()
