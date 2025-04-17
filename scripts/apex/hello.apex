String randomNumber = String.valueOf(Integer.valueOf(Math.random() * 100)); //generate random number between 0 and 99
// JiraWrapper.ProjectWrapper projectWrapper = new JiraWrapper.ProjectWrapper(
// 	'Test Project ' + randomNumber,
// 	'T' + randomNumber,
// 	'Test Description ' + randomNumber
// );
// JiraAPIService.createProject(projectWrapper);

//create issue
// randomNumber = '60';
// JiraWrapper.IssueWrapper issueWrapper = new JiraWrapper.IssueWrapper(
// 	'T' + randomNumber,
// 	'Test Issue ' + randomNumber,
// 	'Test Description ' + randomNumber,
// 	'Task'
// );
// System.debug(JSON.serialize(issueWrapper));
// JiraAPIService.createIssue(issueWrapper);

// JiraWrapper.ProjectWrapper wrapper = new JiraWrapper.IssueWrapperWrapper(
//     'Test Project',
//     'TP123',
//     'This is a test project created via Apex Anonymous.'
// );

// String jiraProjectId = JiraAPIService.createIssue(wrapper);
// System.debug('Created Jira Project ID: ' + jiraProjectId);

JiraWrapper.IssueWrapper issueWrapper = new JiraWrapper.IssueWrapper(
    'TP123', // project key
    'Sample issue from Apex', // summary
    'This issue was created using Apex Anonymous.', // description
    'Task' // issue type
);

String jiraIssueKey = JiraAPIService.createIssue(issueWrapper);
System.debug('Created Jira Issue Key: ' + jiraIssueKey);
