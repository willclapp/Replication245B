const fs = require('fs')
const csv = require('csv-parser')
let exposureResults = []
let trialResults = []

let assetPaths = []

const buildOutput = (exposure, trial, assets) => `
var exposure_stimuli = ${JSON.stringify(exposure, null, 2)}

var trial_stimuli = ${JSON.stringify(trial, null, 2)}

var assetPaths = ${JSON.stringify(assets.flat(), null, 2)}`



// This is which stims.js file is getting written
const writeResults = (exposure, trial, assets) => {
	fs.writeFile('experiment_negative_shift/js/stims.js', buildOutput(exposure, trial, assets), err => {
		if (err) {
			console.error(err)
		}
		console.log("stims.js written")
	})
}

// Getting read for exposure and then for test
fs.createReadStream('experiment_negative_shift/trial_csv/exposure.csv')
	.pipe(csv())
	.on('data', data => {
		exposureResults.push(data)
		assetPaths.push([
			'audio/continua/' + data.stim_audio, 
			'audio/context/' + data.context_audio, 
			'audio/continuation/' + data.continuation_audio, 
			'images/' + data.comp_image, 
			'images/' + data.target_image
		])
	})
	.on('end', () => {
		console.log('done reading exposure.csv')
		fs.createReadStream('experiment_negative_shift/trial_csv/test.csv')
			.pipe(csv())
			.on('data', data => {
				trialResults.push(data)
				assetPaths.push([
					'audio/continua/' + data.stim_audio, 
					'images/' + data.comp_image, 
					'images/' + data.target_image
				])
			})
			.on('end', () => {
				console.log('done reading test.csv')
				writeResults(exposureResults, trialResults, assetPaths)
			})
	})







