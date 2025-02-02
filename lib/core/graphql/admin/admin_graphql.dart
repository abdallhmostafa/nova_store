class AdminGraphql {
  factory AdminGraphql() => instance;
  AdminGraphql._();
  static AdminGraphql instance = AdminGraphql._();
  Map<String, dynamic> getUsersNumber() {
    return {
      'query': '''
{
  users{
		
		name
		
  }
}
    ''',
    };
  }

  Map<String, dynamic> getProductsNumberGraphql() {
    return {
      'query': '''
   {   
          products{
      title
        }
    }
    ''',
    };
  }

  Map<String, dynamic> getCategoriesNumberGraphql() {
    return {
      'query': '''
    {
      categories{
        name
      }
    }
    ''',
    };
  }
}
