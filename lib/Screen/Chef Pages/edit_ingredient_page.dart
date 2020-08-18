import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hips/Models/inventory.dart';
import 'package:hips/Services/authservice.dart';
import 'package:hips/Services/database.dart';
import 'package:provider/provider.dart';

class EditIngredientScreen extends StatefulWidget {

  static const routeName = '/add-inventory';

  @override
  _EditIngredientScreenState createState() => _EditIngredientScreenState();
}

class _EditIngredientScreenState extends State<EditIngredientScreen> {
    final DatabaseService dbservice = DatabaseService();
    final AuthService auth = AuthService();


    double qty;
    String title;
    String uid;

  final _titleFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedIngredient = Inventory(id: null, name: '', qty: 0);
  var _initValues = {
    'name': '',
    'qty': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final ingredientId = ModalRoute.of(context).settings.arguments as String;
      if (ingredientId != null) {
        
        _initValues = {
          'name': _editedIngredient.name,
          'qty': _editedIngredient.qty.toString(),
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _quantityFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    var id = await Provider.of<AuthService>(context, listen: false).getCurrentUID();
    uid = id;
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    // if (_editedIngredient.id != null) {
    //   await Provider.of<Ingredients>(context, listen: false)
    //       .updateIngredients(_editedIngredient.id, _editedIngredient);
    // } else {
      try {
         //Future<String> uid =Provider.of<AuthService>(context, listen: false).getCurrentUID();
        await dbservice.updateInventoryData(title, qty, uid);
        // await Provider.of<Ingredients>(context, listen: false)
        //     .addIngredients(context,_editedIngredient);

      } catch (e) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An error has occured'),
                  content: Text('An issue has occured'),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text('Okay'))
                  ],
                ));
      }
    //}
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Inventory Item'),
          actions: [IconButton(icon: Icon(Icons.save), onPressed: _saveForm)],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : 
            Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: _initValues['name'],
                        decoration: InputDecoration(labelText: 'Title'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_quantityFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide the ingredient name';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          title = newValue;
                          _editedIngredient = Inventory(
                              id: _editedIngredient.id,
                              name: newValue,
                              qty: _editedIngredient.qty);
                        },
                      ),
                      TextFormField(
                        initialValue: _initValues['qty'],
                        decoration:
                            InputDecoration(labelText: 'Quantity (in grams)'),
                        textInputAction: TextInputAction.next,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        focusNode: _quantityFocusNode,
                        onFieldSubmitted: (value) {
                          _saveForm();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the quantity. ';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number. ';
                          }
                          if (double.tryParse(value) <= 0) {
                            return 'Please enter a number greater than zero. ';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          qty = double.parse(newValue);
                          _editedIngredient = Inventory(
                            id: _editedIngredient.id,
                            name: _editedIngredient.name,
                            qty: double.parse(newValue),
                          );
                        },
                      ),
                      RaisedButton(
                        onPressed: _saveForm,
                        child: Text('Save new ingredient'),
                      )
                    ],
                  ),
                )));
  }
}
