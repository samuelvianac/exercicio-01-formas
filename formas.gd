extends Node2D

func _ready():
	# Configurar triângulo
	$Triangulo.polygon = PoolVector2Array([
		Vector2(0, -100),
		Vector2(100, 100),
		Vector2(-100, 100)
	])
	
	# Configurar hexágono
	var hex_points = []
	for i in range(6):
		var angle = i * (2 * PI / 6)
		hex_points.append(Vector2(cos(angle), sin(angle)) * 100)
	$Hexagono.polygon = PoolVector2Array(hex_points)
	
	# Configurar estrela
	$Estrela.polygon = PoolVector2Array([
		Vector2(0, -100), Vector2(40, -40), Vector2(100, -40),
		Vector2(60, 10), Vector2(80, 70), Vector2(0, 40),
		Vector2(-80, 70), Vector2(-60, 10), Vector2(-100, -40),
		Vector2(-40, -40)
	])
	
	# Aplicar interpolação de cores
	aplicar_cores_aleatorias()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			aplicar_cores_aleatorias()

func aplicar_cores_aleatorias():
	# Cores aleatórias para triângulo (3 vértices)
	var cores_triangulo = PoolColorArray()
	for i in range(3):
		cores_triangulo.append(Color(randf(), randf(), randf()))
	$Triangulo.vertex_colors = cores_triangulo
	
	# Cores aleatórias para hexágono (6 vértices)
	var cores_hexagono = PoolColorArray()
	for i in range(6):
		cores_hexagono.append(Color(randf(), randf(), randf()))
	$Hexagono.vertex_colors = cores_hexagono
	
	# Cores aleatórias para estrela (10 vértices)
	var cores_estrela = PoolColorArray()
	for i in range(10):
		cores_estrela.append(Color(randf(), randf(), randf()))
	$Estrela.vertex_colors = cores_estrela
