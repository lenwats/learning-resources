# C# Features in 6 - 9

## Description

These are some of my favorite features in the C# language

</br>

### String Interpolation - C# 6

Instead of:
  - ```
    var msg = user.FirstName + “” + user.LastName + “ is in ” + group.Name;
    ```
We can do:
  - ```       
    var msg = $”{user.FirstName} {user.LastName} is in {group.Name}”;
    ```

</br>

### Out variable - C# 7

Instead of:
  - ```
    int value;
    if (!int.TryParse(strValue, out value)) 
    {
        ...
    }
    ```
We can do:
  - ```       
    if (!int.TryParse(strValue, out int value)) 
    {
        ...
    }
    ```

</br>

### Expression bodied members - C# 6/7

Instead of:
  - ```
    // Readonly properties
    public string Name 
    {
        get { return _name; }
    }
    public decimal Price
    {
        get { return _price; }
    }

    // Read/write properties
    public string Name 
    {
        get { return _name; }
        set { _name = value; }
    }
    ```
We can do:
  - ```       
    // Readonly properties
    public string Name => _name;
    public decimal Price => _price;

    // Read/write properties
    public string Name 
    {
        get => _name;
        set => _name = value;
    }
    ```
We can also change functions.
So instead of:
  - ```       
    public override string ToString() {
        return $”{_name} - {_price}”;
    }
    ```
We can do:
  - ```       
    public override string ToString() => $”{_name} - {_price}”;
    ```

</br>

### Null-Conditional Operator and Null-Coalescing Assignment - C# 6, 8

Instead of:
  - ```       
    if (order != null) 
    {
        if (order.Recipient != null) 
        {
            if (order.Recipient.EmailAddress != null) 
            {
                … Do a thing
            }
        }
    }
    ```
We can use the 'Elvis operator' as the null-coalescing operator:
  - ```       
    if (order?.Recipient?.EmailAddress != null) 
    {
        … Do a thing
    }
    ```
And instead of:
  - ```       
    public void DoSomething(MyOptions options)
    {
        // if options is null, assign it to MyOptions
        if (options == null) 
        {
            options = MyOptions.Default;
        }
    }
    ```
We can do:
  - ```       
    public void DoSomething(MyOptions options)
    {
        // if options is null, assign it to MyOptions, otherwise keep the value
        options ??= MyOptions.Default; 
    }
    ```

</br>

### Record Types - C# 9