const users = [
  {
    id: 0,
    login: "test",
    password: "12345",
  },
];

module.exports.createUser = (req, res, next) => {
  const user = {
    ...req.body,
    id: Date.now(),
  };

  users.push(user);

  res.send(user);
};
