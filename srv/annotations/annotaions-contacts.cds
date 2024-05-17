using {ProductService as call} from '../service';

annotate call.ContactsSet with {
    FullName    @title: 'Full Name';
    Email       @title: 'Email';
    PhoneNumber @title: 'Phone Number';
};


annotate call.ContactsSet with @(
    UI.FieldGroup #Contact : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FullName,
            },
            {
                $Type : 'UI.DataField',
                Value : Email,
            },
            {
                $Type : 'UI.DataField',
                Value : PhoneNumber,
            },
        ],
    },
);
