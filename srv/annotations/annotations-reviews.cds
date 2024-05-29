using {ProductService as call} from '../service';

annotate call.ReviewsSet with {
    Rating     @title: 'Rating';
    date       @title: 'Date' @Common.FieldControl: #ReadOnly;
    User       @title: 'Users' @Common:{
        Text : date,
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
            $Type : 'UI.DataField',
            Value : date,
        },
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
    UI.FieldGroup  : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Value : Rating,
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
    },
    UI.Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup',
            Label : 'Reviews',
        },
    ],
    UI.DataPoint #Rating : {
        $Type : 'UI.DataPointType',
        Value : Rating,
        Visualization : #Rating,
    },
);

