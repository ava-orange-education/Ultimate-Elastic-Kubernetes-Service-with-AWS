def create_budget_alert(budget_amount, email):
    client = boto3.client('budgets')
    
    response = client.create_budget(
        AccountId=**************,
        Budget={
            'BudgetName': 'EKS-Monthly-Budget',
            'BudgetLimit': {
                'Amount': str(budget_amount),
                'Unit': 'USD'
            },
            'TimeUnit': 'MONTHLY',
            'BudgetType': 'COST'
        }
    )
