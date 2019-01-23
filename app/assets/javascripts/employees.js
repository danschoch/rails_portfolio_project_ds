class Employee {
    constructor(firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
}

Employee.prototype.fullName = function() {
    return `${this.firstName} ${this.lastName}`
}


