using {ProductService as call} from '../service';

annotate call.ReviewsSet with {
    Rating     @title: 'Rating';
    Date       @title: 'Date';
    User       @title: 'Users';
    ReviewText @title: 'Review Text';
    HelpFul    @title: 'HelpFul';
};

annotate call.ReviewsSet with @(
    UI.LineItem #Reviews : [
        {
            $Type : 'UI.DataField',
            Value : Rating,
        },
        {
            $Type : 'UI.DataField',
            Value : Date,
        },
        {
            $Type : 'UI.DataField',
            Value : User,
        },
        {
            $Type : 'UI.DataField',
            Value : ReviewText,
        },
        {
            $Type : 'UI.DataField',
            Value : HelpFul,
        },
    ],
);

