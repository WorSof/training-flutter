const db = require('./database');

module.exports = async (reference, data) => {
  const save = await db.ref(reference).push(data);
  return save.key;
};
