module.exports = function () {
    this.Given(/^I have a flaky test$/, function () {
    });
    this.Given(/^I have a non-flaky test$/, function () {
    });
    this.When(/^I run it$/, function () {
    });
    this.Then(/^There is "([^"]*)" chance of it failing$/, function (chanceOfFailing) {
        const numberOfChanceOfFailing = parseInt(chanceOfFailing);
        const andTheResultIs = Math.floor(Math.random() * 100);
        if (andTheResultIs < numberOfChanceOfFailing) {
            throw new Error(`we've roled ${andTheResultIs} which is lower than ${numberOfChanceOfFailing}`)
        }
    });
};