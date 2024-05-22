using {ProductService as call} from '../service';

annotate call.ReviewsSet with {
    Rating     @title: 'Rating';
    Date       @title: 'Date';
    User       @title: 'Users' @Common:{
        Text : Date,
        TextArrangement : #TextLast,
    };
    ReviewText @title: 'Review Text';
    HelpFul    @title: 'HelpFul';
};

annotate call.ReviewsSet with @(
    Common.SemanticKey  : [
        User
    ],
    UI.LineItem #Reviews : [
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#Rating',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '8rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : User,
        },
        {
            $Type : 'UI.DataField',
            Value : ReviewText,
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '44rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : HelpFul,
        },
    ],
    UI.DataPoint #Rating : {
        $Type : 'UI.DataPointType',
        Value : Rating,
        Visualization : #Rating,
    },
);

