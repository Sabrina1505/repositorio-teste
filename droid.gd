extends Area

var direcao = Vector3.ZERO
var posicaoInitial = self.translation
var posicaoFinal = posicaoInitial + (direcao*2)

func Skilklausklausklin():
	direcao = Vector3.RIGHT
	$movimentacao.start()
	$movimentacao.interpolate_property(self, "translation", posicaoInitial, posicaoFinal, 0.1, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
func _physics_process(_delta): Skilklausklausklin()

func _ready():
	pass 
