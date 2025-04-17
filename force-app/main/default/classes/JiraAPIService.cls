/**
 * Service class for making callouts to the Jira API
 */
public with sharing class JiraAPIService {
	/**
	 * Creates a project in Jira
	 * @param projectWrapper The project wrapper object containing all necessary data
	 * @return String The Jira project ID
	 *
	 * TODO: Implement this method to make a callout to Jira API to create a project
	 * Reminder: Extract and return the project ID from the response
	 */

	 private static final String API_NAMED_CREDENTIAL = 'callout:JiraNamedCredential';
	 private static final String PROJECT_API_ENDPOINT = '/rest/api/3/project';
	 private static final String ISSUE_API_ENDPOINT = '/rest/api/3/issue';

	public static String createProject(JiraWrapper.ProjectWrapper projectWrapper) {
		// Your implementation goes here
		//{
			// 	"assigneeType": "PROJECT_LEAD",
			// 	"avatarId": 10200,
			// 	"description": "Postman",
			// 	"key": "PM",
			// 	"leadAccountId": "635748d6b7b39379d71f477b",
			// 	"name": "Example",
			// 	"projectTemplateKey": "com.pyxis.greenhopper.jira:gh-simplified-agility-kanban",
			// 	"projectTypeKey": "software",
			// 	"url": "http://atlassian.com"
			// }
			String projectEndpoint = API_NAMED_CREDENTIAL+PROJECT_API_ENDPOINT;
			HttpRequest req = new HttpRequest();
			req.setEndpoint(projectEndpoint);
			req.setMethod('POST');
			req.setTimeout(120000);
			req.setBody(JSON.serialize(projectWrapper, true));
			req.setHeader('Content-Type', 'application/json');

			Http http = new Http();
			HttpResponse res = http.send(req);
	
		
			if(res.getStatusCode() >= 200 && res.getStatusCode() < 300){
				Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
				return String.valueOf(responseMap.get('id'));
			} else {
				System.debug('Failed to create project' + res.getBody());
				return null;
			}
	}

	/**
	 * Creates an issue in Jira
	 * @param issueWrapper The issue wrapper object containing all necessary data
	 * @return String The Jira issue key
	 *
	 * TODO: Implement this method to make a callout to Jira API to create an issue
	 * Reminder: Extract and return the issue key from the response
	 */
	public static String createIssue(JiraWrapper.IssueWrapper issueWrapper) {
		// Your implementation goes here
		String issueEndpoint = API_NAMED_CREDENTIAL+ISSUE_API_ENDPOINT;
		HttpRequest req = new HttpRequest();
    req.setEndpoint(issueEndpoint);
    req.setMethod('POST');
		req.setTimeout(120000);
    String payload = JSON.serialize(issueWrapper.generateIssuePayloadMap());
    req.setBody(payload);
		req.setHeader('Content-Type', 'application/json');

		Http http = new Http();
    HttpResponse res = http.send(req);

		if(res.getStatusCode() >= 200 && res.getStatusCode() < 300){
			Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
			return String.valueOf(responseMap.get('key'));
		} else {
			System.debug('Failed to create issue' + res.getBody());
			return null;
		}

		
	}
}
