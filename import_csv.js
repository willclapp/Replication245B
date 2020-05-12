const fs = require('fs')
const csv = require('csv-parser')
let exposureResults = []
let trialResults = []

fs.createReadStream('experiment_no_shift/trial_csv/exposure.csv')
	.pipe(csv())
	.on('data', data => exposureResults.push(data))
	.on('end', () => {
		console.log('done reading exposure.csv')
		fs.createReadStream('experiment_no_shift/trial_csv/test.csv')
			.pipe(csv())
			.on('data', data => trialResults.push(data))
			.on('end', () => {
				console.log('done reading test.csv')
				writeResults(exposureResults, trialResults)
			})
	})




const buildOutput = (exposure, trial) => `var exposure_stimuli = ${JSON.stringify(exposure, null, 2)}\n\nvar trial_stimuli = ${JSON.stringify(trial, null, 2)}`


const writeResults = (exposure, trial) => {
	fs.writeFile('experiment_no_shift/js/stims.js', buildOutput(exposure, trial), err => {
		if (err) {
			console.error(err)
		}
		console.log("stims.js written")
	})
}