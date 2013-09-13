exports.get_deployedRevision = function(args, callback) {
  callback(null, 'master');
};

exports.task_deploy = function(stack, baton, args, callback) {
  baton.log.info('Deploy!');
};

exports.targets = {
  'deploy': [
    'task_deploy'
  ]
};
