#BackgroundLayer = new Layer
currentY = 0
	
video = new VideoLayer
    #video: "images/snowboarding.m4v"
    width: Screen.width
    height: Screen.height
    scale: 4.2
    y: currentY

    
video.player.autoplay = true

slider = new SliderComponent
	width: 10
	height: Screen.height - 60
	x: 20
	knobSize: 50
	min: 0, max: 4
	#value: 50

slider.style.background = "linear-gradient(to bottom, #005DAC, #FFF 50%, #009FDF 100%)"
slider.fill.backgroundColor = "transparent"
	
#set the slider center
slider.value = 2

#decrease know scale	
slider.knob.scale = 0.7
#slider.knob.backgroundColor = "#009FDF"

#remove momemtum
slider.knob.draggable.momentum = false

#center slider
slider.centerY()

# Scale to 1 on DragStart
slider.knob.on Events.DragStart, ->
	this.animate 
		properties: {scale: 1}
		#slider.fill.backgroundColor = "#009FDF"
		slider.knob.backgroundColor = "red"
		curve: "spring(400, 30, 0)"
	
# Scale back to its original scale on DragEnd	
slider.knob.on Events.DragEnd, ->
	this.animate 
		properties: {scale: 0.8}
		slider.knob.backgroundColor = "white"
		curve: "spring(400, 30, 0)"

slider.on "change:value", (event) ->
	print this.value
	if this.value < 2
    	video.y = currentY =+ this.value * 10
    else if this.value > 2
    	video.y = currentY =- this.value * 10


