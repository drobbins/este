authorizedUser = (userId) ->
    userId and Roles.userIsInRole userId, ["admin", "physician"]

Meteor.publish "patients", ->
    Patients.find() if authorizedUser @userId

Meteor.publish "observations", (patientId) ->
    Observations.find patientId: patientId if authorizedUser @userId
