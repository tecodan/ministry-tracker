Factory.define :emailtemplate_1, :class => EmailTemplate do |e|
   e.id '1'
   e.correspondence_type_id '1'
   e.outcome_type 'NOW'
   e.subject 'Please verify applying user to intranet'
   e.from 'hal@ministrytracker.com'
   e.body '\'Dear {{recipient.first_name}},\r\n\r\n{{sender.first_name}} {{sender.last_name}} applied on {{sender.user.created_at}} to gain a user login \r\nfor the Student Life Intranet. For the user to become a registered member of the \r\n{{campus.name}} Student Life movement, all applying users must identify a leader \r\nwho would recognise them as being part of the ministry. {{sender.first_name}} \r\nidentified you as being the leader who knows them best and would be able to \r\nverify their details.\r\n\r\nGiven details:\r\nFirstName: {{sender.first_name}}\r\nNickName: {{sender.preferred_name}}\r\nLastName: {{sender.last_name}}\r\nEmail: {{sender.currentaddress.email}}\r\nPhone: {{sender.currentaddress.phone}}\r\n\r\nCould you visit <a href="{{receipt | receipt_link}}">this link</a> and indicate whether this \r\nstudent is someone you recognise.\r\n\r\nA WARNING:\r\nTo recognise someone requires you to be able to identify their email address as \r\nauthentic. Be aware that intruders can imitate a true student''s identity by \r\nclaiming all their details (name and phone numbers), but not their email \r\naddress. If their email address  is imitated then the intruder will never \r\nreceive the password associated with their login account. If you cannot verify \r\nthe given email address as valid, then you are required to make personal contact \r\nwith the person (a phone call should be sufficient) to clarify whether it is \r\nthe real person who made the application. Your attention to this matter is \r\nappreciated as a critical link in maintaining our intranet''s security.\r\n\r\nWHAT HAPPENS IF I CAN''T IDENTIFY THEM?\r\nIf you decline a recognition of {{sender.first_name}}, {{sender.heshe}} will be informed of \r\nthis fact by email and given the option of contacting you directly to ''jog'' \r\nyour memory. You will then have the option of still confirming them at \r\n<a href="{{receipt | receipt_link}}">this link</a>.\r\n\r\nThank you,\r\nHal\r\n{{testData.first.who}}''
   e.template '\'o:Liquid::Template:\n@rooto:Liquid::Document:@nodelist[%"\nDear o:Liquid::Variable:\r@filters[\0:@markup"recipient.first_name:\n@name"recipient.first_name"\n,\r\n\r\no;	;\n[\0;"sender.first_name;"sender.first_name" o;	;\n[\0;"sender.last_name;"sender.last_name" applied on o;	;\n[\0;"sender.user.created_at;"sender.user.created_at"p to gain a user login \r\nfor the Student Life Intranet. For the user to become a registered member of the \r\no;	;\n[\0;"campus.name;"campus.name"| Student Life movement, all applying users must identify a leader \r\nwho would recognise them as being part of the ministry. o;	;\n[\0;"sender.first_name;"sender.first_name"… \r\nidentified you as being the leader who knows them best and would be able to \r\nverify their details.\r\n\r\nGiven details:\r\nFirstName: o;	;\n[\0;"sender.first_name;"sender.first_name"\r\nNickName: o;	;\n[\0;"\Zsender.preferred_name;"\Zsender.preferred_name"\r\nLastName: o;	;\n[\0;"sender.last_name;"sender.last_name"\r\nEmail: o;	;\n[\0;" sender.currentaddress.email;" sender.currentaddress.email"\r\nPhone: o;	;\n[\0;" sender.currentaddress.phone;" sender.currentaddress.phone""\r\n\r\nCould you visit <a href="o;	;\n[[:receipt_link[\0;"receipt | receipt_link;"receipt"f">this link</a> and indicate whether this \r\nstudent is someone you recognise.\r\n\r\nA WARNING:\r\nTo recognise someone requires you to be able to identify their email address as \r\nauthentic. Be aware that intruders can imitate a true student''s identity by \r\nclaiming all their details (name and phone numbers), but not their email \r\naddress. If their email address  is imitated then the intruder will never \r\nreceive the password associated with their login account. If you cannot verify \r\nthe given email address as valid, then you are required to make personal contact \r\nwith the person (a phone call should be sufficient) to clarify whether it is \r\nthe real person who made the application. Your attention to this matter is \r\nappreciated as a critical link in maintaining our intranet''s security.\r\n\r\nWHAT HAPPENS IF I CAN''T IDENTIFY THEM?\r\nIf you decline a recognition of o;	;\n[\0;"sender.first_name;"sender.first_name", o;	;\n[\0;"sender.heshe;"sender.heshe"· will be informed of \r\nthis fact by email and given the option of contacting you directly to ''jog'' \r\nyour memory. You will then have the option of still confirming them at \r\n<a href="o;	;\n[[;\r[\0;"receipt | receipt_link;"receipt"*">this link</a>.\r\n\r\nThank you,\r\nHal\r\no;	;\n[\0;"testData.first.who;"testData.first.who''
   e.created_at '2009-04-07 09:38:44'
   e.updated_at '2009-04-07 09:38:44'
end
