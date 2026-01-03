extends StaticBody2D

@export var levelWidth = 30000
@export var amplitude = 100.0
@export var groundDepth = 1000
@export var step = 10
var noise = FastNoiseLite.new()
@onready var car = get_node("../Car")
@onready var camera = get_node("../Camera2D")

func _ready() -> void:
	if not globals.doNotPickSeed:
		globals.randomSeed = int(Time.get_unix_time_from_system()/10)
	globals.doNotPickSeed = false
	noise.seed = globals.randomSeed
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.frequency = 0.005
	var surfacePoints = PackedVector2Array()
	for x in range(0,100,10):
		var noiseVal = noise.get_noise_1d(100)
		var y = (noiseVal * amplitude)-groundDepth
		surfacePoints.append(Vector2(x, y))
	for x in range(1000, 1000+levelWidth, step):
		var noiseVal = noise.get_noise_1d(x*0.1)
		@warning_ignore("integer_division")
		var y = (noiseVal * amplitude)-groundDepth
		#var y = 20
		surfacePoints.append(Vector2(x, y))
		amplitude += 1
	var polyPoints = surfacePoints.duplicate()
	polyPoints.append(Vector2(1000+levelWidth-step, groundDepth))
	polyPoints.append(Vector2(0, groundDepth))
	$Line2D.points = surfacePoints
	$CollisionPolygon2D.polygon = polyPoints
	$Polygon2D.polygon = polyPoints
	position.y = groundDepth
	camera.position_smoothing_enabled = false
	camera.position.y = noise.get_noise_1d(100)-150-groundDepth
	await (camera.position.y != noise.get_noise_1d(100)-150-groundDepth)
	camera.position_smoothing_enabled = true
	
