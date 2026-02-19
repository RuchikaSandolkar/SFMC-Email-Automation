/*
Master Suppression Framework
Combines:
- Hard Bounce
- Unsubscribe
- Complaint
- Manual Block
*/

SELECT SubscriberKey AS Contact_Key
FROM _Subscribers
WHERE Status = 'Unsubscribed'

UNION

SELECT Contact_Key
FROM DE_Hard_Bounce_Suppression

UNION

SELECT SubscriberKey
FROM _Complaint

UNION

SELECT Contact_Key
FROM DE_Manual_Block

Target DE: DE_Master_Suppression
