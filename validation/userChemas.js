const yup = require("yup");

const USER_CREATION_SCHEMA = yup.object({
  login: yup.string().required(),
  email: yup.string().email().required(),
  password: yup.string().required(),
  isMale: yup.bool().required(),
});

module.exports.USER_CREATION_SCHEMA = USER_CREATION_SCHEMA;
