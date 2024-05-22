using {ProductService as call} from '../service';

annotate call.InventorySet with {
    StockNumber @title: 'Stock Bin Number';
    Department  @title: 'Deparment' @Common:{
        Text : Department.name,
        TextArrangement : #TextOnly,
    };
    Min         @title: 'Minimun';
    Max         @title: 'Maximun';
    Value       @title: 'Value';
    LotSize     @title: 'Lot Size';
    Quantity    @title: 'Ordered Quantity';
};

annotate call.InventorySet with @(
    Common.SemanticKey  : [
        StockNumber
    ],
    UI.LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : StockNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : Department_ID,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#ChartBullet',
            Label : '',
        },
        {
            $Type : 'UI.DataField',
            Value : LotSize,
        },
        {
            $Type : 'UI.DataField',
            Value : Quantity,
        },
    ],
    UI.DataPoint #DataPointBullet:{
        $Type : 'UI.DataPointType',
        Value : Value,
        MaximumValue : Max,
        MinimumValue : Min,
        CriticalityCalculation : {
            $Type : 'UI.CriticalityCalculationType',
            ImprovementDirection : #Maximize ,
            ToleranceRangeLowValue : 100,
            DeviationRangeLowValue : 20,
        },
    },
    UI.Chart #ChartBullet : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bullet,
        Measures : [
            Value
        ],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                DataPoint : '@UI.DataPoint#DataPointBullet',
                Measure : Value,
            },
        ],
    },
);

