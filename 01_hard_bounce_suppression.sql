/*
Project: SFMC Enterprise Email Automation Architecture
Module: Hard Bounce Suppression Framework
Purpose: Identify hard-bounced subscribers and sync into Master Suppression DE
Execution: Scheduled daily via Automation Studio

Source Data View:
    _Bounce

Target Data Extension:
    DE_Master_Suppression

Governance Rule:
    Hard bounce = Permanent failure
    Must be excluded from all future sends
*/

SELECT 
    b.SubscriberKey AS Contact_Key,
    b.EmailAddress AS Email,
    b.BounceCategory,
    b.BounceType,
    b.SMTPBounceReason,
    GETDATE() AS Suppression_Date,
    'Hard Bounce' AS Suppression_Reason
FROM _Bounce b
WHERE b.BounceCategory = 'Hard bounce'
AND b.EventDate >= DATEADD(day, -1, GETDATE())

Target DE: DE_Hard_Bounce_Suppression
