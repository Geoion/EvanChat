@RestResource(urlMapping='/WeChatRest/*')
global with sharing class WechartRest
{
	@HttpGet
		global static Account getAccountByName()
		{
			RestRequest req = RestContext.request;
			System.debug(req.requestURI);
			String accName = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
			Account result = [select Name, Id, Phone from Account where Name = :accName];
			return result;
		}

	@HttpPost
		global static String createAccount (String name, String phone)
		{
			Account a = new Account(Name = name, Phone = phone);
			insert a;
			return a.Id;
		}
}