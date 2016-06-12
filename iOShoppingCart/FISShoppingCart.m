//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Christopher Webb-Orenstein on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart


-(NSUInteger)calculateTotalPriceInCents
{
    NSUInteger sum = 0;
    
    for (FISItem *item in self.items) {
        sum += item.priceInCents;
    }
    return sum;
}


-(void)addItem:(FISItem *)item
{
    [self.items addObject:item];
}


-(void)removeItem:(FISItem *)item
{
    NSUInteger itemIndex = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:itemIndex];
}


-(void)removeAllItemsLikeItem:(FISItem *)item
{
    [self.items removeObjectIdenticalTo:item];
}


-(void)sortItemsByNameAsc
{
    NSSortDescriptor *sortByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [self.items sortUsingDescriptors:@[sortByNameAsc]];
}


-(void)sortItemsByNameDesc
{
    NSSortDescriptor *sortByNameDsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors:@[sortByNameDsc]];
}


-(void)sortItemsByPriceInCentsAsc
{
    NSSortDescriptor *sortByPriceAsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents"
                                                                     ascending:YES];
    [self.items sortUsingDescriptors:@[sortByPriceAsc]];
}


-(void)sortItemsByPriceInCentsDesc
{
    NSSortDescriptor *sortByPriceDsc = [[NSSortDescriptor alloc] initWithKey:@"priceInCents"
                                                                   ascending:NO];
    [self.items sortUsingDescriptors:@[sortByPriceDsc]];
}


-(NSArray *)allItemsWithName:(NSString *)name
{
    NSArray *namesArray = [[NSArray alloc]init];
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", name];
    namesArray = [self.items filteredArrayUsingPredicate:namePredicate];
    return namesArray;
}


-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)minimumPrice
{
    NSArray *minimumPrices = [[NSArray alloc]init];
    NSPredicate *minimumPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", minimumPrice];
    minimumPrices = [self.items filteredArrayUsingPredicate:minimumPricePredicate];
    return minimumPrices;
}


-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)maximumPrice
{
    NSArray *maximumPrices = [[NSArray alloc]init];
    NSPredicate *maximumPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu",  maximumPrice];
    maximumPrices = [self.items filteredArrayUsingPredicate:maximumPricePredicate];
    return maximumPrices;
}

@end
