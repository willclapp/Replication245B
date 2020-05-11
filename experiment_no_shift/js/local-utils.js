function build_trial_option(img_path, type) {
	var trial_option = $("<div>")
		.addClass("trial_option")

	var image_container = $("<div>")
		.addClass(type + "_image")

	var radio_button = $("<input />")
		.attr("type", "radio")
		.attr("name", "selection")
		.attr("value", type)

	var image = $("<img />")
		.attr("src", "images/" + img_path)

	image_container.append(image)
	trial_option
		.append(image_container)
		.append(radio_button)

	return trial_option
}